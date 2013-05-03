module SessionsHelper
  def sign_in user
      self.current_user = user
  end

  def current_user= user
    @current_user = user
  end
  
  def current_user
    @current_user
  end
  
  def sign_out
    self.current_user = nil
  end
end
