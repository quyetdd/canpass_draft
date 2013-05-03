class ClientsUsersController < ApplicationController
  # GET /clients_users
  # GET /clients_users.json
  def index
    @clients_users = ClientsUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients_users }
    end
  end

  # GET /clients_users/1
  # GET /clients_users/1.json
  def show
    @clients_user = ClientsUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clients_user }
    end
  end

  # GET /clients_users/new
  # GET /clients_users/new.json
  def new
    @clients_user = ClientsUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clients_user }
    end
  end

  # GET /clients_users/1/edit
  def edit
    @clients_user = ClientsUser.find(params[:id])
  end

  # POST /clients_users
  # POST /clients_users.json
  def create
    @clients_user = ClientsUser.new(params[:clients_user])

    respond_to do |format|
      if @clients_user.save
        format.html { redirect_to @clients_user, notice: 'Clients user was successfully created.' }
        format.json { render json: @clients_user, status: :created, location: @clients_user }
      else
        format.html { render action: "new" }
        format.json { render json: @clients_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clients_users/1
  # PUT /clients_users/1.json
  def update
    @clients_user = ClientsUser.find(params[:id])

    respond_to do |format|
      if @clients_user.update_attributes(params[:clients_user])
        format.html { redirect_to @clients_user, notice: 'Clients user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @clients_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients_users/1
  # DELETE /clients_users/1.json
  def destroy
    @clients_user = ClientsUser.find(params[:id])
    @clients_user.destroy

    respond_to do |format|
      format.html { redirect_to clients_users_url }
      format.json { head :no_content }
    end
  end
end
