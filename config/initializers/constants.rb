module Constants
  ## Constants::NUMでアクセスできる
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i.freeze
  DAY_ARRAY = {
    "0": "日",
    "1": "月",
    "2": "火",
    "3": "水",
    "4": "木",
    "5": "金",
    "6": "土"
  }.freeze
  URL = case Rails.env
        when "development"
          Settings.network.url.ngrok
        else
          "https://gonzodiary.herokuapp.com"
        end
end
