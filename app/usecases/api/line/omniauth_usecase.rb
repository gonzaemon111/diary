module Api
  module Line
    class OmniauthUsecase < Devise::OmniauthCallbacksController
      def initialize(auth, current_user_id)
        @auth = auth
        @current_user_id = current_user_id
      end

      def execute
        omniauth_profile =
          OmniauthProfile.where(
            provider: @auth["provider"],
            uid: @auth["uid"]
          ).first

        if omniauth_profile
          return omniauth_sign_in(@auth, omniauth_profile)
        else
          return omniauth_sign_up(@auth)
        end
      end

      private

      def omniauth_sign_up(auth)
        user =
          if @current_user_id
            User.find(@curret_user_id)
          else
            User.create!(
              email: auth["info"]["email"] || nil,
              name: auth["info"]["name"],
              password: Devise.friendly_token[0, 20],
              sign_in_count: 0,
              failed_attempts: 0
            )
          end

        @omniauth_profile = OmniauthProfile.create!(
          user_id: user.id,
          provider: auth["provider"],
          uid: auth["uid"],
          token: auth["credentials"]["token"],
          refresh_token: auth["credentials"]["refresh_token"],
          name: auth["info"]["name"],
          image: auth["info"]["image"],
          description: auth["info"]["description"],
          email: auth["info"]["email"] || nil
        )

        { user: user, omniauth_profile: @omniauth_profile }
      end

      def omniauth_sign_in(auth, omniauth_profile)
        update_profile(auth, omniauth_profile)
      end

      def update_profile(auth, omniauth_profile)
        return false unless auth["provider"] == omniauth_profile.provider && auth["uid"] == omniauth_profile.uid

        omniauth_profile.token = auth["credentials"]["token"] if omniauth_profile.token != auth["credentials"]["token"]
        omniauth_profile.refresh_token = auth["credentials"]["refresh_token"] if omniauth_profile.token != auth["credentials"]["refresh_token"]
        omniauth_profile.name = auth["info"]["name"] if omniauth_profile.token != auth["info"]["name"]
        omniauth_profile.image = auth["info"]["image"] if omniauth_profile.token != auth["info"]["image"]
        omniauth_profile.description = auth["info"]["description"] if omniauth_profile.token != auth["info"]["description"]
        omniauth_profile.email = auth["info"]["email"] if auth["info"]["email"] && omniauth_profile.email != auth["info"]["email"]

        omniauth_profile.save

        { user: omniauth_profile.user, omniauth_profile: omniauth_profile }
      end
    end
  end
end
