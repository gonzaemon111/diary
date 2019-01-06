require "line/bot"

module Api
  module Line
    module Events
      module Messages
        class Text
          def initialize(event, client)
            @event = event
            @client = client
          end

          def execute
            return Api::Line::PushTaskUsecase.new(@event["message"]["text"], @event["source"]["userId"]).execute if task?
            return Api::Line::PushDiaryUsecase.new(@event["message"]["text"], @event["source"]["userId"]).execute if nikki?

            message = {
              type: "text",
              text: "#{@event["message"]["text"]}\nって送ってくれてありがとう💙💚💛💜💗🤗"
            }
            @client.reply_message(@event["replyToken"], message)
          end

          private

          def task?
            @event["message"]["text"].include?("task") ||
              @event["message"]["text"].include?("タスク") ||
              @event["message"]["text"].include?("リマインド") ||
              @event["message"]["text"].include?("リマインダー")
          end

          def nikki?
            @event["message"]["text"].include?("nikki") ||
              @event["message"]["text"].include?("日記") ||
              @event["message"]["text"].include?("diary")
          end
        end
      end
    end
  end
end
