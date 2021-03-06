class SessionsController < ApplicationController
  def new
    if current_user
      flash[:notice] = 'You are already logged in!'
      redirect_to "/users/#{current_user.id}"
    end
  end 

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.username}"
      redirect_to '/'
    else
      flash[:notice] = 'Your email or password was incorrect!'
      render :new
    end
  end

  def logout
    session.delete(:user_id)
    flash[:notice] = 'You have been logged out!'
    redirect_to '/'
  end
end