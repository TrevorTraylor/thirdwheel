module UsersHelper
  def sign_in(user)
    session[:user_id] = user.id
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  # getter method
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
