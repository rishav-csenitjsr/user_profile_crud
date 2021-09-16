class ApplicationController < ActionController::Base
    # protect_from_forgery with: :exception
    # skip_before_action :verify_authenticity_token
    before_action :authenticate_user_profile!
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters

      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :phone_number, :email, :password) }

      devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password) }

      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :phone_number, :email, :password, :password_confirmation, :current_password) }
      
    end
end
