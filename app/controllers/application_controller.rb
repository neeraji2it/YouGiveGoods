class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
    layout :get_layout 
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :first_name,:last_name,:password, :password_confirmation,:user_type,:status,:updated_by)}
    end
    
    def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(Admin)
        admin_dashboards_path
      else
        dashboards_path
      end
    end

    def after_sign_up_path_for(resource_or_scope)
      after_sign_in_path_for(resource_or_scope)
    end
    
    private
    def get_layout
      if current_admin
        return "admin"
      else
        return "application"
      end
    end
    
    def is_admin?
      unless current_admin
        flash[:alert] = "Please login with admin. you don't have permissions"
        redirect_to '/'
      end
    end
  end
