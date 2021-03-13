class BeatsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :show]
  
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

def edit
    @beat = Beat.find(params[:id])
  end

  def update
    @beat = Beat.find(params[:id])
    @beat.update(beat_params)
    if @beat.save
      redirect_to "/beats/#{@beat.id}"
    else
      flash[:notice] = 'Your information could not be saved'
      redirect_to "/beats/#{@beat.id}/update"
    end
  end

  def destroy
    beat = Beat.find(params[:id])
    beat.beat_tags.delete_all
    beat.delete
    redirect_to "/users/#{beat.user_id}"
  end

  private

  def beat_params
    params.require(:beat).permit(:name, :image, :description, :audio)
  end
end