module Api
  module Line
    class PushSignupUsecase < BaseUsecase
      def initialize(uid)
        @uid = uid
        @client ||= client
      end

      def execute
        messages = []
        messages.push user_signup_message
        messages.push how_to_use_this
        @client.push_message(@uid, messages)
      end

      private

      def user_signup_message
        {
          type: "text",
          text: "ユーザ登録ありがとう😇\nこれからここに日記を作ってね✌️"
        }
      end

      def how_to_use_this
        {
          type: "text",
          text: "使い方は、文章のどこかに\n\n\"日記\"\n\nと入れてね☺️"
        }
      end
    end
  end
end
