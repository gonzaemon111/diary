require "line/bot"

module Api
  module Line
    class PushMessageUsecase
      def initialize(nikki)
        @datetime = nikki[:datetime]
        @value = nikki[:value]
        @client ||= ::Line::Bot::Client.new { |config|
          Rails.logger.debug "config ------------------------- #{config}"
          Rails.logger.debug "config.nil? ------------------------- #{config.nil?}"
          config.channel_secret = ENV["LINE_CHANNEL_SECRET"] || Settings.line.channel_secret
          Rails.logger.debug "config.channel_secret ------------------------- #{config.channel_secret}"
          config.channel_token = ENV["LINE_CHANNEL_TOKEN"] || Settings.line.channel_token
        }
        @user_id = ENV["LINE_USER_ID"] || Settings.line.user_id # あとはここだけ、修正する必要がある。
      end

      def execute
        message = {
          type: "text",
          text: "#{@datetime}の日記💓\n 内容:\n#{@value}"
        }
        @client.push_message(@user_id, message)
      end
    end
  end
end
