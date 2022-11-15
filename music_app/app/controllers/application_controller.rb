class ApplicationController < ActionController::Base
  def current_user
    user ||= User.find_by(session_token: session[:session_token]) #why ||= instead of =?
    user
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def logged_in?
    # session[session_token] == current_user.session_token
    !!current_user
  end

  def login(user)
    session[:session_token] = user.reset_session_token
  end

  def logout
    current_user.reset_session_token #if logged_in? #i dont need this i think
    session[:session_token] = nil
    @current_user = nil
  end
end
