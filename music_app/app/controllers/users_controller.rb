class UsersController < ApplicationController
  def new
    user = User.new #what does this do
    render :new
  end

  def create
    @user =  User.new(user_params)
    if @user.save
      login(@user)
      render :show 
    else
      render :new
    end
  end

  def show
    @user = User.find_by(email: params[:email]) #User.find_by(id: params[:id])
    render :show# user_url #@user
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end