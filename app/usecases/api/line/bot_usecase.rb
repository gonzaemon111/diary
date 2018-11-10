require "line/bot"

module Api
  module Line
    class BotUsecase
      def initialize(request)
        @request = request
        @client ||= client
      end

      def execute
        body = @request.body.read

        signature = @request.env["HTTP_X_LINE_SIGNATURE"]

        unless @client.validate_signature(body, signature)
          error 400 do "Bad Request" end
        end

        events = @client.parse_events_from(body)

        events.each { |event|
          case event
          when ::Line::Bot::Event::Message
            case event.type
            when ::Line::Bot::Event::MessageType::Text
              message = {
                type: "text",
                text: "#{event.message["text"]}\nって送ってくれてありがとう💙💚💛💜💗🤗"
              }
              @client.reply_message(event["replyToken"], message)
            when ::Line::Bot::Event::MessageType::Image
              message = {
                type: "text",
                text: "ごめん、画像はぼっとできないんだ、、、"
              }
              @client.reply_message(event["replyToken"], message)
            when ::Line::Bot::Event::MessageType::Sticker
              message = {
                type: "sticker",
                packageId: "1",
                stickerId: event.message["stickerId"]
              }
              @client.reply_message(event["replyToken"], message)
            end
          end
        }
        "ok"
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
    end
  end
end
