module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end 
  
  def current_user=(user)
    @current_user = user 
  end 
  
  def current_user
    @current_user ||= User.find_by(remember_token: cookies[:remeber_token])
  end 

end
