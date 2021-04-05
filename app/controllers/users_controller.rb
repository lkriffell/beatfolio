class UsersController < ApplicationController
  before_action :logged_in_user, only: [:follow, :unfollow]

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
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      @follower_count = @user.followers.size
      @following_count = @user.following.size
      @like_count = Like.where(user_id: @user.id).size
      @comment_count = @user.comments.size
      if current_user
        @own_page = true if @user == current_user
        @following = true if current_user.following.exists?(user_id: @user.id)
      end
    else 
      flash[:notice] = "It appears the user you're looking for does not exist"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to "/users/#{@user.id}"
    else
      flash[:notice] = 'Your profile information could not be saved'
      redirect_to "/users/#{@user.id}/update"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :image)
  end
end