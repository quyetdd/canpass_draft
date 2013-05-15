class Redis
  module Search
    def self.complete(type, w, options = {})
      limit = options[:limit] || 10 
      conditions = options[:conditions] || []
      return [] if (w.blank? and conditions.blank?) or type.blank?
      
      prefix_matchs = []
      # This is not random, try to get replies < MTU size
      rangelen = Redis::Search.config.complete_max_length
      prefix = w.downcase
      key = Search.mk_complete_key(type)
      
      binding.pry
      if start = Redis::Search.config.redis.zrank(key,prefix)
        count = limit
        max_range = start+(rangelen*limit)-1
        range = Redis::Search.config.redis.zrange(key,start,max_range)
        binding.pry
        while prefix_matchs.length <= count
          binding.pry
          start += rangelen
          break if !range or range.length == 0
          range.each {|entry|
            minlen = [entry.length,prefix.length].min
            if entry[0...minlen] != prefix[0...minlen]
              count = prefix_matchs.count
              break
            end
            if entry[-1..-1] == "*" and prefix_matchs.length != count
              prefix_matchs << entry[0...-1]
            end
          }
          range = range[start..max_range]
        end
      end
      
      # 组合 words 的特别 key 名
      words = []
      words = prefix_matchs.uniq.collect { |w| Search.mk_sets_key(type,w) }
      
      # 组合特别 key ,但这里不会像 query 那样放入 words， 因为在 complete 里面 words 是用 union 取的，condition_keys 和 words 应该取交集
      condition_keys = []
      if !conditions.blank?
        conditions = conditions[0] if conditions.is_a?(Array)
        conditions.keys.each do |c|
          condition_keys << Search.mk_condition_key(type,c,conditions[c])
        end
      end
      
      # 按词语搜索
      temp_store_key = "tmpsunionstore:#{words.join("+")}"
      if words.length > 1
        if !Redis::Search.config.redis.exists(temp_store_key)
          # 将多个词语组合对比，得到并集，并存入临时区域   
          Redis::Search.config.redis.sunionstore(temp_store_key,*words)
          # 将临时搜索设为1天后自动清除
          Redis::Search.config.redis.expire(temp_store_key,86400)
        end
        # 根据需要的数量取出 ids
      else
        temp_store_key = words.first
      end
      
      # 如果有条件，这里再次组合一下
      if !condition_keys.blank?
        condition_keys << temp_store_key if !words. blank?
        temp_store_key = "tmpsinterstore:#{condition_keys.join('+')}"
        if !Redis::Search.config.redis.exists(temp_store_key)
          Redis::Search.config.redis.sinterstore(temp_store_key,*condition_keys)
          Redis::Search.config.redis.expire(temp_store_key,86400)
        end
      end
      
      ids = Redis::Search.config.redis.sort(temp_store_key,
                                            :limit => [0,limit], 
                                            :by => Search.mk_score_key(type,"*"),
                                            :order => "desc")
      return [] if ids.blank?
      hmget(type,ids)
    end
  end
end