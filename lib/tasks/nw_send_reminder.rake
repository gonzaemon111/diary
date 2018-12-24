namespace :remind do
  desc "次世代ネットワークミニッツのリマインド機能"
  task :nw_send_remind do
    if Date.today.strftime("%w") == "4"
      Slack::Notifier.new(ENV["NW_SLACK_WEBHOOK_URL"]).ping("どうせ、ミニッツやってないんだろ？\nミニッツやれよ馬鹿野郎👍\n")
    else
      date = Date.today.strftime("%w")
      Rails.logger.debug "今日は#{Constants::DAY_ARRAY[date.to_i]}曜日です。"
    end
  end
end
