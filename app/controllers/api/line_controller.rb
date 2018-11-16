module Api
  class LineController < ApplicationController
    require "line/bot"

    # callbackアクションのCSRFトークン認証を無効
    protect_from_forgery except: [:callback]

    def callback
      result = Api::Line::ReceiveUsecase.new(request, receive_params).execute
      if result
        head :ok
      else
        head 400
      end
    end

    private

    def receive_params
      params.permit(
        :destination,
        events: [
          :type,
          :replyToken,
          {
            source: %i[
              userId
              type
            ]
          },
          :timestamp,
          {
            message: [
              :type,
              :id,
              :text,
              {
                contentProvider: %i[type]
              }
            ]
          },
          {
            postback: %i[data]
          }
        ]
      )
    end
  end
end
