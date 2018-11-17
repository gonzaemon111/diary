require "line/bot"

module Api
  module Line
    class BaseUsecase
      def client
        case Rails.env
        when "development"
          ::Line::Bot::Client.new { |config|
            config.channel_secret = Settings.line.messaging_api.channel_secret
            config.channel_token = Settings.line.messaging_api.channel_token
          }
        else
          ::Line::Bot::Client.new { |config|
            config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
            config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
          }
        end
      end
    end
  end
end
