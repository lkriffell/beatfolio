class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    current_user.comments.create(description: params[:description], beat_id: params[:id])
    redirect_to "/beats/#{params[:id]}"
  end
  
  def destroy
    comment = Comment.find(params[:comment_id])
    comment.delete
    redirect_to "/beats/#{params[:id]}"
  end

  def index
    @user = User.find(params[:id])
    @comments = @user.comments
  end
end