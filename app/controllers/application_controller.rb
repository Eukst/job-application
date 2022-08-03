# frozen_string_literal:true

# application class default class
class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
  add_flash_types :info, :error, :success
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[first_name last_name address mobile_no city state user_role pincode])
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[first_name last_name address mobile_no city state user_role pincode])
  end
end
