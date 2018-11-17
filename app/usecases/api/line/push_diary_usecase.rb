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

        Rails.logger.debug "message.class -- #{message.class}"

        return false if message.class != String
        message
      end

      def nikki_create?(message)
        user = OmniauthProfile.find_by(uid: @uid).user

        nikki = Nikki.create!(
          value: message,
          datetime: DateTime.now.in_time_zone,
          user_id: user.id
        )
        return false unless nikki
        nikki
      end

      def push_messages(nikki)
        push_message = if nikki
                          {
                            type: "text",
                            text: "今日の日記☺️\n--------------------------\n日時:#{nikki.datetime}\n\n#{nikki.value}"
                          }
                        else
                          {
                            type: "text",
                            text: "すみません🙇‍\n予期せぬエラーが起きました。"
                          }
                        end
        @client.push_message(@uid, push_message)
      end
    end
  end
end