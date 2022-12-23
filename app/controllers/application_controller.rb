class ApplicationController < ActionController::Base
  respond_to :html, :json
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    posts_path
  end
  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
