class ApplicationController < ActionController::Base
  def login!(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end

  def deny_current_user!
    redirect_to cats_url if current_user
  end
  

  helper_method :current_user
end
