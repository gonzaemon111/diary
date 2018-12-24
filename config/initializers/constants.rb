module Constants
  ## Constants::NUMでアクセスできる
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i.freeze
  DAY_ARRAY = [
    "日", "月", "火", "水", "木", "金", "土"
  ].freeze
  URL = case Rails.env
        when "development"
          Settings.network.url.ngrok
        else
          "https://gonzodiary.herokuapp.com"
        end
end
