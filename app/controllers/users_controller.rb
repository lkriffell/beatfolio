class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome, #{@user.username}!"
      redirect_to user_path(user)
    else
      generate_flash(@user)
      render :new
    end
  end

  def new; end

  def show
    @user = User.find(params[:id])
    @follower_count = @user.followers.size
    @following_count = @user.following.size
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end