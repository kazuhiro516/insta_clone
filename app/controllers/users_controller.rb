class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_all = User.includes(:user).page(params[:page])
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
