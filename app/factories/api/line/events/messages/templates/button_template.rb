module Api
  module Line
    module Events
      module Messages
        module Templates
          class ButtonTemplate
            def initialize; end
  
            def execute
              {
                "type": "template",
                "altText": "This is a buttons template",
                "template": {
                  "type": "buttons",
                  "thumbnailImageUrl": "https://images.unsplash.com/photo-1534989713668-e6c993fd1554?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=5d8b8f376e6302a259ceb828475527cc&auto=format&fit=crop&w=1100&q=80",
                  "imageAspectRatio": "rectangle",
                  "imageSize": "cover",
                  "imageBackgroundColor": "#000000",
                  "title": "本日の日記",
                  "text": "作成しますか？",
                  "defaultAction": {
                    "type": "uri",
                    "label": "View detail",
                    "uri": "https://gonzodiary.herokuapp.com/"
                  },
                  "actions": [
                    {
                      "type": "postback",
                      "label": "はい",
                      "data": "no"
                    },
                    {
                      "type": "postback",
                      "label": "いいえ",
                      "data": "no"
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
end
