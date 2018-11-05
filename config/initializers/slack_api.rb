require "slack"

Slack.configure do |config|
  config.token = Settings.slack.verification_token
  # メセージ送信Slack.chat_postMessage(text: 'テキスト', username: '適当な名前', channel: "#チャンネル名")
end
