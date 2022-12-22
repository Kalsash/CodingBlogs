class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def destroy
    @users = User.find(params[:id])
    @users.destroy
    redirect_to users_path, notice: 'User deleted.'
  end
end
