require "line/bot"

module Api
  module Line
    module Events
      module Messages
        class Sticker
          def initialize(event, client)
            @event = event
            @client = client
          end

          def execute
            message = {
              type: "sticker",
              packageId: "1",
              stickerId: @event["message"]["stickerId"]
            }
            @client.reply_message(@event["replyToken"], message)
          end
        end
      end
    end
  end
end
