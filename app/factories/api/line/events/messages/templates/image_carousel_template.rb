module Api
  module Line
    module Events
      module Messages
        module Templates
          class ImageCarouselTemplate
            def initialize; end
  
            def execute
              {
                "type": "template",
                "altText": "this is a image carousel template",
                "template": {
                  "type": "image_carousel",
                  "columns": [
                    {
                      "imageUrl": "https://example.com/bot/images/item1.jpg",
                      "action": {
                        "type": "postback",
                        "label": "Buy",
                        "data": "action=buy&itemid=111"
                      }
                    },
                    {
                      "imageUrl": "https://example.com/bot/images/item2.jpg",
                      "action": {
                        "type": "message",
                        "label": "Yes",
                        "text": "yes"
                      }
                    },
                    {
                      "imageUrl": "https://example.com/bot/images/item3.jpg",
                      "action": {
                        "type": "uri",
                        "label": "View detail",
                        "uri": "http://example.com/page/222"
                      }
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
