class UserFollowsController < ApplicationController
  def create
    if User.exists?(params[:id])
      UserFollow.create(user_id: params[:id], follower_id: current_user.id)
    end
    redirect_to "/users/#{params[:id]}"
  end

  def destroy
    current_user.following.find_by(user_id: params[:id]).delete
    redirect_to "/users/#{params[:id]}"
  end
end