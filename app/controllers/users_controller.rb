class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome, #{@user.username}!"
      redirect_to "/users/#{@user.id}"
    else
      flash[:notice] = "Something went wrong, did you fill out all fields?"
      redirect_to users_new_path
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
    params.require(:user).permit(:username, :email, :password, :image)
  end
end