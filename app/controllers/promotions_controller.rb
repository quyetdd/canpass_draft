class PromotionsController < ApplicationController
  require "finder"
  def index
    @promotions = Promotion.all
  end

  # display dashboard screen
  def show
    #@promotion = Promotion.find(params[:id])
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
    f.series(:type=> 'spline',:name=> 'Clicks', :data=> [300, 200, 300, 0, 500, 350, 250, 270, 280, 260, 262, 265])
	f.series(:type=> 'spline',:name=> 'Imp', :data=> [200, 0, 200, 500, 400, 450, 420, 350, 240, 230, 211, 245], :color => 'green')
	f.legend(:align => "right", :verticalAlign => "top", :y => 0, :x => -50, :layout => 'vertical', :borderWidth => 0)
	f.xAxis(:categories => ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
			:labels => {:style => {:color => '#6D869F', :font => '12px Helvetical'}},
			)
	f.yAxis(:min => 0, :title => '')
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
    @search = Promotion.where("promotion_name like ?", "%#{params[:q]}%")
    lines = @search.collect do |item|
      puts item
      "#{escape_javascript(item['promotion_name'])}#!##{item['id']}#!##{item['promotion_name']}#!##{item['promotion_name']}#!##{escape_javascript(item['promotion_name'])}"
    end
    if @search.count > 0
      render :text => lines.join("\n")
    else
      render text: ""
    end
  end
end
