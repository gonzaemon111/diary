require "line/bot"

module Api
  module Line
    module Events
      module Messages
        class Image
          def initialize(event, client)
            @event = event
            @client = client
          end

          def execute
            message = {
              type: "text",
              text: "ごめん、画像はぼっとできないんだ、、、"
            }
            @client.reply_message(@event["replyToken"], message)
          end
        end
      end
    end
  end
end
