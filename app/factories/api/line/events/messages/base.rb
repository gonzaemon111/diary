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
            case @event["message"]["type"]
            when "text"
              Api::Line::Events::Messages::Text.new(@event, @client).execute
            when "image"
              Api::Line::Events::Messages::Image.new(@event, @client).execute
            when "sticker"
              Api::Line::Events::Messages::Sticker.new(@event, @client).execute
            end
          end
        end
      end
    end
  end
end
