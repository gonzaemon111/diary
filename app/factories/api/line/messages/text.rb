module Api
  module Line
    module Messages
      class Text
        def initialize(event)
          @event = event
        end

        def execute
          {
            type: "text",
            text: "#{@event.message["text"]}\nって送ってくれてありがとう💙💚💛💜💗🤗"
          }
        end
      end
    end
  end
end