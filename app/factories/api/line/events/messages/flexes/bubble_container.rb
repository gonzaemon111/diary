module Api
  module Line
    module Events
      module Messages
        module Flexes
          class BubbleContainer
            def initialize; end
  
            def execute
              {
                "type": "bubble",
                "header": {
                  "type": "box",
                  "layout": "vertical",
                  "contents": [
                    {
                      "type": "text",
                      "text": "Header text"
                    }
                  ]
                },
                "hero": {
                  "type": "image",
                  "url": "https://example.com/flex/images/image.jpg"
                },
                "body": {
                  "type": "box",
                  "layout": "vertical",
                  "contents": [
                    {
                      "type": "text",
                      "text": "Body text"
                    }
                  ]
                },
                "footer": {
                  "type": "box",
                  "layout": "vertical",
                  "contents": [
                    {
                      "type": "text",
                      "text": "Footer text"
                    }
                  ]
                },
                "styles": {
                  "comment": "See the example of a bubble style object"
                }
              }
            end
          end
        end
      end
    end
  end
end
