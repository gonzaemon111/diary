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
          # Rails.logger.debug "ばいえうbv； ------ #{JSON.parse(event)}"
          case event
          when ::Line::Bot::Event::Message
            message = case event.type
                      when ::Line::Bot::Event::MessageType::Text
                        Api::Line::Messages::Text.new(event).execute
                      when ::Line::Bot::Event::MessageType::Image
                        Api::Line::Messages::Image.new(event).execute
                      when ::Line::Bot::Event::MessageType::Sticker
                        Api::Line::Messages::Sticker.new(event).execute
                      end
            @client.reply_message(event["replyToken"], message)
          end
        }
        true
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
