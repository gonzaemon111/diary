require "line/bot"

module Api
  module Line
    class BotUsecase
      def initialize(request)
        @request = request
        @client ||= ::Line::Bot::Client.new { |config|
          config.channel_secret = ENV["LINE_CHANNEL_SECRET"] || Settings.line.channel_secret
          config.channel_token = ENV["LINE_CHANNEL_TOKEN"] || Settings.line.channel_token
        }
      end

      def execute
        body = @request.body.read

        signature = @request.env["HTTP_X_LINE_SIGNATURE"]

        unless @client.validate_signature(body, signature)
          error 400 do "Bad Request" end
        end

        events = @client.parse_events_from(body)

        events.each { |event|
          case event
          when ::Line::Bot::Event::Message
            case event.type
            when ::Line::Bot::Event::MessageType::Text
              message = {
                type: "text",
                text: "これはボットですよ"
              }
              @client.reply_message(event["replyToken"], message)
            when ::Line::Bot::Event::MessageType::Image
              message = {
                type: "text",
                text: "ごめん、画像はぼっとできないんだ、、、"
              }
              @client.reply_message(event["replyToken"], message)
            when ::Line::Bot::Event::MessageType::Sticker
              Rails.logger.debug "ここやで #{body}"
              message = {
                type: "sticker",
                packageId: "1",
                stickerId: event.message["stickerId"]
              }
              puts "マジで本番 : #{@client.reply_message(event['replyToken'], message)}"
              @client.reply_message(event["replyToken"], message)
            end
          end
        }
        "ok"
      end
    end
  end
end
