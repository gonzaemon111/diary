module Api
  class OmniauthCallbackController < Devise::OmniauthCallbacksController
    def line
      line_omniauth
    end

    private

    def line_omniauth
      current_user_id = current_user || nil
      result = Api::Line::OmniauthUsecase.new(request.env["omniauth.auth"], current_user_id).execute
      @user = result[:user]
      if @user.persisted? || result[:omniauth_profile].persisted?
        sign_in_and_redirect @user
      else
        head :unprocessable_entity
      end
    end

    def after_sign_in_path_for(_resource)
      root_path
    end
  end
end
