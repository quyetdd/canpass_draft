class Promotion < ActiveRecord::Base
  attr_accessible :client_id, :create_usr_id, :del_flg, :promotion_category_id, :promotion_name, :status, :update_usr_id

  belongs_to :client
  belongs_to :promotion_category
  
  include Redis::Search
  redis_search_index(:title_field => :promotion_name, :alias_field => :alias,
    :prefix_index_enable => true)

  def alias
    [self.promotion_name]
  end
end
