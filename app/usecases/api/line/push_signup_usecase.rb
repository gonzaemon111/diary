module Api
  module Line
    class PushSignupUsecase < BaseUsecase
      def initialize(uid)
        @uid = uid
        @client ||= client
      end

      def execute
        @client.push_message(@uid, user_signup_message)
      end

      private

      def user_signup_message
        {
          type: "text",
          text: "ユーザ登録ありがとう😇\nこれからここに日記を作ってね✌️"
        }
      end
    end
  end
end
