class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by_id session[:user_id]
  end

  protected

  def authenticate_user!
    redirect_to root_path if current_user.nil?
  end

  def guest?
    redirect_to user_path(current_user) if current_user
  end
end
