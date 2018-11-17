module Api
  module Line
    module Events
      module Messages
        class ErrorText
          def initialize; end

          def execute
            {
              type: "text",
              text: "すみません🙇‍\n予期せぬエラーが起きました。"
            }
          end
        end
      end
    end
  end
end
