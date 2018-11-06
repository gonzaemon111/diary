module Api
  class LineController < ApplicationController
    require 'line/bot'

    # callbackアクションのCSRFトークン認証を無効
    protect_from_forgery :except => [:callback]
  
    def client
      @client ||= Line::Bot::Client.new { |config|
        config.channel_secret = ENV["LINE_CHANNEL_SECRET"] || Settings.line.channel_secret
        config.channel_token = ENV["LINE_CHANNEL_TOKEN"] || Settings.line.channel_token
      }
    end
  
    def callback
      result = Api::Line::BotUsecase.new(request).execute
      if result == "ok"
        head :ok
      else
        head 400
      end
    end
  end
end