module Slack
  class NwReminderWorker
    include Sidekiq::Worker
    sidekiq_options queue: :test

    def perform(uid)
      Api::Line::PushReminderUsecase.new(uid).execute
    end
  end
end
