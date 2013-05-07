class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user
      if user.can_login?
        if user.authenticate(params[:session][:password])
          flash[:success] = "Welcome to Canpass"
          sign_in user
          redirect_to user
        else
          user.update_login_fail
          flash[:error] = "Invalid email/password combination"
          render :new
        end
      else
        flash[:error] = "You are blocked for 5 minutes. Please try again later"
        render :new
      end
    else
      flash[:error] = "Invalid email/password combination"
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end