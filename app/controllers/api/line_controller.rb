module Api
  class LineController < ApplicationController
    require "line/bot"

    # callbackアクションのCSRFトークン認証を無効
    protect_from_forgery except: [:callback]

    def callback
      result = Api::Line::BotUsecase.new(request).execute
      if result
        head :ok
      else
        head 400
      end
    end
  end
end
