class UsersController < ApplicationController
  before_filter :authenticate_user!,
                only: [:logout, :show]

  before_filter :guest?, except: [:logout, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.create! params[:user]
  end

  def input
  end

  def login
    @user = User.login params
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def logout
    current_user.logout
    session[:user_id] = nil
    redirect_to root_path
  end

  def show
    @users = User.online
  end
end
