class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end
  
  def must_super
    redirect_to(root_path) unless current_user.role_id == 1  
  end
end
