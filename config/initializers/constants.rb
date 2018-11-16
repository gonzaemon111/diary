module Constants
  ## Constants::NUMでアクセスできる
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i.freeze
  URL = case Rails.env
        when "production"
          "https://gonzodiary.herokuapp.com"
        else
          Settings.network.url.ngrok
        end
end
