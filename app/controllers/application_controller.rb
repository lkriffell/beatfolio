class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def logged_in_user
    unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
    end
  end
end
