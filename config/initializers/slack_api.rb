require "slack"

Slack.configure do |config|
  config.token = ENV["SLACK_VERIFICATION_TOKEN"]
  # メセージ送信Slack.chat_postMessage(text: 'テキスト', username: '適当な名前', channel: "#チャンネル名")
end
