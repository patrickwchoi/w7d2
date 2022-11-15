class UsersController < ApplicationController
  def new
    user = User.new #what does this do
    render :new
  end

  def create
    @user =  User.new(user_params)
    if @user.save
      render @user #you can just render a user instance?
    else
      render :new
    end
  end

  def show
    @user = User.find_by(params[:id])
    render @user
  end

  private
  def user_params
    params.require(:users).permit(:email, :password)
  end
end