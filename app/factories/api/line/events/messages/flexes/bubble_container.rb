module Api
  module Line
    module Events
      module Messages
        module Flexes
          class BubbleContainer

            IMAGE_URL = [
              "https://cdn.pixabay.com/photo/2018/05/13/17/08/notebook-3397135__480.jpg",
              "https://cdn.pixabay.com/photo/2015/05/31/14/23/organizer-791939__480.jpg",
              "https://cdn.pixabay.com/photo/2017/11/28/16/49/notebook-2984108__480.jpg",
              "https://cdn.pixabay.com/photo/2015/07/02/10/10/day-planner-828611__480.jpg",
              "https://cdn.pixabay.com/photo/2017/05/03/11/46/beach-2280942__480.jpg",
              "https://cdn.pixabay.com/photo/2017/08/03/13/15/flat-lay-2576200__480.jpg",
              "https://cdn.pixabay.com/photo/2016/03/01/11/07/paper-1230086__480.jpg",
              "https://cdn.pixabay.com/photo/2016/12/29/21/17/notebook-1939358__480.jpg",
              "https://cdn.pixabay.com/photo/2016/01/19/17/57/diary-1149992__480.jpg",
              "https://cdn.pixabay.com/photo/2017/06/24/01/07/writing-2436476__480.jpg"
            ].freeze

            def initialize(nikki)
              @nikki = nikki
            end

            def execute
              {  
                "type": "flex",
                "altText": "this is a flex message",
                "contents": {
                  "type": "bubble",
                  "header": {
                    "type": "box",
                    "layout": "vertical",
                    "contents": [
                      {
                        "type": "text",
                        "text": @nikki.datetime,
                        "align": "center"
                      }
                    ]
                  },
                  "hero": {
                    "type": "image",
                    "url": IMAGE_URL[rand(0..9)],
                    "size": "5xl"
                  },
                  "body": {
                    "type": "box",
                    "layout": "vertical",
                    "contents": [
                      {
                        "type": "text",
                        "text": @nikki.value,
                        "size": "lg",
                        "align": "center"
                      }
                    ]
                  }
                }
              }
            end
          end
        end
      end
    end
  end
end
