class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # strong parametersを設定し、usernameを許可
    devise_parameter_sanitizer.for(:sign_up) { |u|
      u.permit(
        :name,
        :password,
        :password_confirmation
      )
    }
  end
end
