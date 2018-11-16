module Api
  module Line
    module Events
      module Messages
        class Sticker
          def initialize(event)
            @event = event
          end

          def execute
            {
              type: "sticker",
              packageId: "1",
              stickerId: @event.message["stickerId"]
            }
          end
        end
      end
    end
  end
end
