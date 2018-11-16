module Api
  module Line
    module Events
      module Messages
        module Templates
          class ConfirmTemplate
            def initialize; end

            def execute
              {
                "type": "template",
                "altText": "this is a confirm template",
                "template": {
                  "type": "confirm",
                  "text": "Are you sure?",
                  "actions": [
                    {
                      "type": "message",
                      "label": "Yes",
                      "text": "yes"
                    },
                    {
                      "type": "message",
                      "label": "No",
                      "text": "no"
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
