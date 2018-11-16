require "line/bot"

module Api
  module Line
    module Events
      module Messages
        class Base
          def initialize(event, client)
            @event = event
            @client = client
          end

          def execute
            Rails.logger.debug "Api::Line::Events::Messages::Basedesu"
            message = case @event["message"]["type"]
                      when "text"
                        Api::Line::Events::Messages::Templates::ButtonTemplate.new.execute
                      when "image"
                        Api::Line::Events::Messages::Image.new(@event).execute
                      when "sticker"
                        Api::Line::Events::Messages::Sticker.new(@event).execute
                      end
            Rails.logger.debug "message -- #{message}"
            Rails.logger.debug "eirgb --- #{@event["replyToken"]}"
            @client.reply_message(@event["replyToken"], message)
          end
        end
      end
    end
  end
end