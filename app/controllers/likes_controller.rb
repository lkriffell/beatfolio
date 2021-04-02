class LikesController < ApplicationController
  before_action :logged_in_user, only: [:create, :show, :destroy]
  
  def create
    if !Like.find_by(beat_id: params[:id], user_id: current_user.id)
      Like.create(beat_id: params[:id], user_id: current_user.id)
    end
    determine_redirect
  end

  def destroy
    Like.find_by(beat_id: params[:id], user_id: current_user.id).delete
    determine_redirect
  end

  def index
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  private

  def determine_redirect
    current_uri = request.referer
    if current_uri && current_uri[22..25] == 'feed'
      redirect_to "/feed"
    elsif current_uri && current_uri[22..25] == 'disc'
      redirect_to "/discover"
    else
      redirect_to "/beats/#{params[:id]}"
    end
  end
end