require "line/bot"

module Api
  module Line
    class BotUsecase < BaseUsecase
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
          when ::Line::Bot::Event::Postback
            next
          when ::Line::Bot::Event::Follow
            next
          when ::Line::Bot::Event::Join
            next
          when ::Line::Bot::Event::Beacon
            next
          when ::Line::Bot::Event::Message
            message = case event.type
                      when ::Line::Bot::Event::MessageType::Text
                        Api::Line::Messages::Templates::ButtonTemplate.new.execute
                      when ::Line::Bot::Event::MessageType::Image
                        Api::Line::Messages::Image.new(event).execute
                      when ::Line::Bot::Event::MessageType::Sticker
                        Api::Line::Messages::Sticker.new(event).execute
                      end
            @client.reply_message(event["replyToken"], message)
          else
            raise "予期せぬエラーが起こりました。"
          end
        }
        true
      end
    end
  end
end
