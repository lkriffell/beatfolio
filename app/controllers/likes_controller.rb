class LikesController < ApplicationController
  before_action :logged_in_user, only: [:create, :show, :destroy]
  
  def create
    if !Like.find_by(beat_id: params[:id], user_id: current_user.id)
      Like.create(beat_id: params[:id], user_id: current_user.id)
    end
    redirect_to "/beats/#{params[:id]}"
  end

  def destroy
    Like.find_by(beat_id: params[:id], user_id: current_user.id).delete
    redirect_to "/beats/#{params[:id]}"
  end

  def index
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id)
  end
end