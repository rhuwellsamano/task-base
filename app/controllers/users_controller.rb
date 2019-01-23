class UsersController < ApplicationController
  before_action :current_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    # @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    redirect_to user_path(@user)
  end

  def edit
    # @user = user.find(params[:id])
  end

  def update
    # @user = user.find(params[:id])
    @user.update(user_params)

    redirect_to user_path(@user)
  end

  def destroy
    # @user = user.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

private
  def user_params
    params.require(:user).permit(:name, :slogan)
  end

  def current_user
    @user = User.find(params[:id])
  end


end
