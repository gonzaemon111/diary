module Constants
  ## Constants::NUMでアクセスできる
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i.freeze

  DAY_ARRAY = %w[
    日 月 火 水 木 金 土
  ].freeze

  URL = case Rails.env
        when "development"
          ENV["NGROK_URL"]
        else
          "https://gonzodiary.herokuapp.com"
        end
end
