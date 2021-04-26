class BeatTagsController < ApplicationController
  before_action :logged_in_user
  
  def edit
    @beat = Beat.find(params[:id])
    if current_user.beats.include?(@beat)
      return @beat
    else
      redirect_to beats_show_path(@beat)
    end
  end

  def create
    if beat_tag_params[:tag] != ""
      BeatTag.create(beat_tag_params)
    else
      flash[:now] = "Tags can't be blank!"
    end
    redirect_to "/beats/#{beat_tag_params[:beat_id]}/tags/edit"
  end

  def destroy
    tag = BeatTag.find(params[:id])
    tag.delete
    redirect_to "/beats/#{tag.beat_id}/tags/edit"
  end

  private

  def beat_tag_params
    params.require(:beat_tag).permit(:tag, :beat_id)
  end
end