module Api
  module Line
    module Events
      module Leaves
        class Base
          def initialize(event, client)
            @event = event
            @client = client
          end

          def execute
            true
          end
        end
      end
    end
  end
end