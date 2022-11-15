class SessionsController < ApplicationController
  def new
    session = Session.new
    render :new
  end

  def create
  incoming_email = params[:users][:email]
  incoming_password = params[:users][:password]  #where do we set a variable equal to password? our form in views?
  @user = User.find_by_credentials(incoming_email, incoming_password)
  if @user
    session[:session_token] = @user.session_token
    redirect_to user_url 
  else
    render :new #how is this different than redirect_to new_session_url
  end
end

  def destroy
    # user = User.find_by(session_token: session[:session_token])
    # user.reset_session_token
    # session[:session_token] = nil
    logout
    redirect_to new_session_url
  end
end