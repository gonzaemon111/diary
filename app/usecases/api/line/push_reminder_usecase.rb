module Api
  module Line
    class PushReminderUsecase < BaseUsecase
      def initialize(user_id)
        @user_id = user_id
        @client = client
      end

      def execute
        message = {
          type: "text",
          text: "リマインダーです✋\n今日の分の課題、ちゃんとやった？\n一応確認しとけって🐶"
        }
        @client.push_message(@user_id, message)
      end
    end
  end
end
