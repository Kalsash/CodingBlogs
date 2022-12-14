class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  protected
  def check_admin
    redirect_to home_path, notice:"Access Denied!" unless current_user.admin?
  end
end