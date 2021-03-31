class SearchController < ApplicationController
  def show
    if params[:keyword]  
      @beats = Beat.where("name like ?", "%#{params[:keyword]}%")
      @related_beats = Beat.related_beats(params[:keyword])
      @users = User.where("username like ?", "%#{params[:keyword]}%")
      @search = params[:keyword]
    else  
      flash[:notice] = ('You must provide a keyword')
    end
  end
end