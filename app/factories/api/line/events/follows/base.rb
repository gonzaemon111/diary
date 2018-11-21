require "line/bot"

module Api
  module Line
    module Events
      module Follows
        class Base
          def initialize(event, client)
            @event = event
            @client = client
          end

          def execute
            Slack::Notifier.new(ENV["SLACK_WEBHOOK_URL"]).ping("誰かがMyDiaryを友達追加してくれました☺️")
            messages = []
            messages.push follow_message
            messages.push user_signup_message
            @client.reply_message(@event["replyToken"], messages)
          end

          private

          def follow_message
            {
              type: "text",
              text: "友達追加ありがとう😇\nこれは、日記アプリケーションで、あなたの毎日の思い出を綴っていきましょう👍\nまずは、下記のメッセージからユーザ登録してください🙇‍"
            }
          end

          def user_signup_message
            {
              "type": "template",
              "altText": "This is a buttons template",
              "template": {
                "type": "buttons",
                "thumbnailImageUrl": "https://images.unsplash.com/photo-1534989713668-e6c993fd1554?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=5d8b8f376e6302a259ceb828475527cc&auto=format&fit=crop&w=1100&q=80",
                "imageAspectRatio": "rectangle",
                "imageSize": "cover",
                "imageBackgroundColor": "#000000",
                "title": "MyDiary",
                "text": "ユーザ登録",
                "defaultAction": {
                  "type": "uri",
                  "label": "View detail",
                  "uri": Constants::URL + "/users/auth/line"
                },
                "actions": [
                  {
                    "type": "uri",
                    "label": "ユーザ登録",
                    "uri": Constants::URL + "/users/auth/line"
                  }
                ]
              }
            }
          end
        end
      end
    end
  end
end
