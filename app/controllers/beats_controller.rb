class BeatsController < ApplicationController
  before_action require: :user
  def new; end

  def create
    @beat = current_user.beats.create(name: beat_params[:name])
    if @beat.save
      beat_params[:tags].split(',').each do |tag|
        @beat.beat_tags.create(tag: tag)
      end
    end
    redirect_to "/beats/#{@beat.id}"
  end

  def show
    @beat = Beat.find(params[:id])
  end

  private

  def beat_params
    params.require(:beat).permit(:name, :image, :tags)
  end
end