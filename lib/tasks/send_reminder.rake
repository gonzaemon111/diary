namespace :remind do
  desc "課題のリマインド機能"
  task :send_remind => :environment do
    Slack::Notifier.new(ENV["SLACK_WEBHOOK_URL"]).ping("今日の分の課題ちゃんとやったか？\n✋courseN@vin確認しとけよ☺️\n")
    profiles = Profile.all
    if profiles.present?
      ActiveRecord::Base.transaction do
        Rails.logger.debug "profile.count ---- #{profiles.count}"
        profiles.map do |profile|
          Line::ReminderWorker.perform_async(profile.uid)
        end
      end
    end
  end
end
