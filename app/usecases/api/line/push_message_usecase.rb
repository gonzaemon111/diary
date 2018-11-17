module Api
  module Line
    class PushMessageUsecase < BaseUsecase
      def initialize(nikki)
        @client ||= client
        @datetime = nikki[:datetime]
        @value = nikki[:value]
        @user_id = ENV["LINE_USER_ID"] || Settings.line.messaging_api.user_id # あとはここだけ、修正する必要がある。
      end

      def execute
        message = {
          type: "text",
          text: "#{@datetime}の日記💓\n 内容:\n#{@value}"
        }
        @client.push_message(@user_id, message)
      end
    end
  end
end
