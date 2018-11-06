module Usecases
  module nikkis
    class CreateUsecase
      def initialize(nikki)
        @nikki = nikki
        @client = client
      end

      private

      def client
        @client ||= Line::Bot::Client.new { |config|
          config.channel_secret = ENV["LINE_CHANNEL_SECRET"] || Settings.line.channel_secret
          config.channel_token = ENV["LINE_CHANNEL_TOKEN"] || Settings.line.channel_token
        }
      end
    end
  end
end