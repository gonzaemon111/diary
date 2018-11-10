require "line/bot"

module Api
  module Line
    class PushMessageUsecase
      def initialize(nikki)
        @datetime = nikki[:datetime]
        @value = nikki[:value]
        @client ||= client
        @user_id = ENV["LINE_USER_ID"] || Settings.line.messaging_api.user_id # あとはここだけ、修正する必要がある。
      end

      def execute
        message = {
          type: "text",
          text: "#{@datetime}の日記💓\n 内容:\n#{@value}"
        }
        @client.push_message(@user_id, message)
      end

      private

      def client
        case Rails.env
        when "development"
          return ::Line::Bot::Client.new { |config|
            config.channel_secret = Settings.line.messaging_api.channel_secret
            config.channel_token = Settings.line.messaging_api.channel_token
          }
        else
          return ::Line::Bot::Client.new { |config|
            config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
            config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
          }
        end
      end
    end
  end
end
