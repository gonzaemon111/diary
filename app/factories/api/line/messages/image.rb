module Api
  module Line
    module Messages
      class Image
        def initialize(event)
          @event = event
        end

        def execute
          {
            type: "text",
            text: "ごめん、画像はぼっとできないんだ、、、"
          }
        end
      end
    end
  end
end