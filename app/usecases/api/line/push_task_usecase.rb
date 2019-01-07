module Api
  module Line
    class PushTaskUsecase < BaseUsecase
      def initialize(nikki, uid)
        @nikki = nikki
        @uid = uid
        @client ||= client
      end

      def execute
        if task_include?
          result = task_split
          task = task_create(result)
          push_messages(task)
        else
          return false
        end
      end

      private

      def task_split
        messages = @nikki.split("\n")

        # date_time = DateTime.parse(messages[1])
        return false if messages[1].class != String

        value = messages[2]
        return false if value.class != String

        { value: value, date_time: messages[1] }
      end

      def task_create(result)
        user = OmniauthProfile.find_by(uid: @uid).user

        Rails.logger.debug "ここだよ#{result} , #{user.id}"

        task = Task.create!(
          value: result[:value],
          date_time: result[:date_time],
          is_done: false,
          user_id: user.id
        )

        Slack::Notifier.new(ENV["SLACK_WEBHOOK_URL"]).ping(I18n.t("messages.reminder.make", name: user.name, value: task.value, date_time: task.date_time))
        return false unless task

        task
      end

      def push_messages(task)
        push_message =
          if task
            Api::Line::Events::Messages::Templates::ButtonTemplate.new(task).execute
          else
            Api::Line::Events::Messages::ErrorText.new.execute
          end
        @client.push_message(@uid, push_message)
      end

      def task_include?
        @nikki.include?("task") ||
          @nikki.include?("remind") ||
          @nikki.include?("リマインド")
      end
    end
  end
end
