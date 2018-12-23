namespace :remind do
  desc "次世代ネットワークミニッツのリマインド機能"
  task :nw_send_remind => :environment do
    Slack::Notifier
      .new(ENV["NW_SLACK_WEBHOOK_URL"])
      .ping("ミニッツやれよ馬鹿野郎👍\n")
  end
end