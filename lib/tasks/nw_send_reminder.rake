namespace :remind do
  desc "次世代ネットワークミニッツのリマインド機能"
  task :nw_send_remind => :environment do
    Slack::NwReminderWorker.perform_async
  end
end
