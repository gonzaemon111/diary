module Api
  module Line
    class PushDiaryUsecase < BaseUsecase
      def initialize(nikki, uid)
        @nikki = nikki
        @uid = uid
        @client ||= client
      end

      def execute
        message = nikki_split
        return false unless message

        nikki = nikki_create?(message)
        return false unless nikki

        push_messages(nikki)
      end

      private

      def nikki_split
        messages = []
        if @nikki.include?("日記")
          messages.concat(@nikki.split("日記"))
        elsif @nikki.include?("nikki")
          messages.concat(@nikki.split("nikki"))
        elsif @nikki.include?("diary")
          messages.concat(@nikki.split("diary"))
        end

        message = ""
        messages.map do |mes|
          message.concat mes
        end

        return false if message.class != String

        message
      end

      def nikki_create?(message)
        user = OmniauthProfile.find_by(uid: @uid).user

        nikki = Nikki.create!(
          value: message,
          datetime: Time.now.in_time_zone,
          user_id: user.id
        )

        Slack::Notifier.new(ENV["SLACK_WEBHOOK_URL"]).ping("#{user.name}さんが\n日記を作成しました✌️")
        return false unless nikki

        nikki
      end

      def push_messages(nikki)
        push_message =
          if nikki
            Api::Line::Events::Messages::Flexes::BubbleContainer.new(nikki).execute
          else
            Api::Line::Events::Messages::ErrorText.new.execute
          end
        @client.push_message(@uid, push_message)
      end
    end
  end
end
