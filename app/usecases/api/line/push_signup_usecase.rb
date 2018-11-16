require "line/bot"

module Api
  module Line
    class PushSignupUsecase
      def initialize(uid)
        @client ||= client
        @uid = uid
      end

      def execute
        @client.push_message(@uid, user_signup_message)
      end

      private

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

      def user_signup_message
        {
          type: "text",
          text: "ユーザ登録ありがとう😇\nこれからここに日記を作ってね✌️"
        }
      end
    end
  end
end
