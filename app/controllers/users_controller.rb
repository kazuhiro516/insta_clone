class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_all = User.includes(:user).page(params[:page])
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def following
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
end
