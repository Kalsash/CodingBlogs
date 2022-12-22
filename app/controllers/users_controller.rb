class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @users = User.find_by_id(params[:id])
  end
  def destroy
    @users = User.find(params[:id])
    @users.destroy
    redirect_to home_path, notice: 'User deleted.'
  end
end
