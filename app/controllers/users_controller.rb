class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create! params[:user]
  end

  def input
  end

  def login
    @user = User.login params[:user]
    session[:user_id] = @user.id if @use
    redirect_to user(@user)
  end

  def logout
    current_user.logout
    session[:user_id] = nil
  end

  def show
    @users = User.online
  end
end
