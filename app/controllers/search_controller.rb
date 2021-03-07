class SearchController < ApplicationController
  def show
    if params[:keyword].nil?  
      flash[:notice] = ('You must provide a keyword')
      redirect_to('/')
    else  
      @beats = Beat.where("name like ?", "%#{params[:keyword]}%")
      @related_beats = Beat.related_beats(params[:keyword])
      @users = User.where("username like ?", "%#{params[:keyword]}%")
      @search = params[:keyword]
    end
  end
end