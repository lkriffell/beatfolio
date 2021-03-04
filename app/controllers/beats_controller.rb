class BeatsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  
  def new; end

  def create
    @beat = current_user.beats.create(beat_params)
    if @beat.save
      if params[:beat][:tags]
        params[:beat][:tags].split(',').each do |tag|
          @beat.beat_tags.create(tag: tag.strip)
        end
      end
      redirect_to "/beats/#{@beat.id}"
    else
      flash[:notice] = "Something went wrong, did you fill out all fields?"
      redirect_to "/beats/new"
    end
  end

  def show
    @beat = Beat.find(params[:id])
  end

  private

  def beat_params
    params.require(:beat).permit(:name, :image, :description)
  end
end