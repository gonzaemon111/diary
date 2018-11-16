module Constants
  ## Constants::NUMでアクセスできる
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i.freeze
  URL = case Rails.env
        when "development"
          Settings.network.url.ngrok
        else
          "https://gonzodiary.herokuapp.com"
        end
end
