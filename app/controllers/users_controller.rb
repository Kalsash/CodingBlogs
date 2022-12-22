class UsersController < ApplicationController
  def index
    @user = User.all
  end
  def show
    @user = User.find_by_id(params[:id])
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to home_path, notice: 'User deleted.'
  end
end
