class PromotionsController < ApplicationController
  def index
    @promotions = Promotion.all
  end

  # display dashboard screen
  def show
    #@promotion = Promotion.find(params[:id])
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
    f.series(:type=> 'spline',:name=> 'Clicks', :data=> [300, 200, 300, 0, 500])
	f.series(:type=> 'spline',:name=> 'Imp', :data=> [200, 0, 200, 500, 400], :color => 'yellow')
	end
  end

  def new
    @promotion = Promotion.new
    @clients = Client.all
  end

  def edit
    @promotion = Promotion.find(params[:id])
    @clients = Client.all
  end

  def create
    @promotion = Promotion.new(params[:promotion])
    @promotion.create_usr_id = current_user.id
    if @promotion.save
      flash[:success] = "Promotion was successfully created"
      redirect_to @promotion
    else
      render :new
    end
  end

  def update
    @promotion = Promotion.find(params[:id])
    @promotion.update_usr_id = current_user_id
    if @promotion.update_attributes(params[:promotion])
      flash[:success] = "Promotion was successfully updated"
      redirect_to @promotion
    else
      render :edit
    end
  end

  def destroy
    @promotion = Promotion.find(params[:id])
    @promotion.destroy
    redirect_to promotions_path
  end
  
  def search
    if params[:q].blank?
      render :text => ""
      return
    end
    params[:q].gsub!(/'/,'')
    @search = Redis::Search.complete("Promotion", params[:q])    
    lines = @search.collect do |item|
      puts item
      "#{escape_javascript(item['title'])}#!##{item['id']}#!##{item['title']}#!##{item['title']}#!##{escape_javascript(item['title'])}"
    end
    render :text => lines.join("\n")
  end
end
