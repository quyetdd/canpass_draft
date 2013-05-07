class PromotionsController < ApplicationController
  def index
    @promotions = Promotion.all
  end

  def show
    @promotion = Promotion.find(params[:id])
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
end
