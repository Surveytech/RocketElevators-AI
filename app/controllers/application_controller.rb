class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception

    skip_before_action :verify_authenticity_token
    before_action :update_allowed_parameters, if: :devise_controller?

    rescue_from CanCan::AccessDenied do
      flash[:error] = 'Access denied!'
      redirect_to root_url
    end

    protected

    def update_allowed_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :title, :email, :password)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :title, :email, :password, :current_password)}
    end
end
