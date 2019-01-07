module Api
  class TasksController < ApplicationController
    require "line/bot"

    def finish
      user = User.find(params[:user_id])
      task = Task.find(params[:task_id])
      push_message =
        if task.user_id == user.id && task.is_done == false
          task.is_done = true
          task.save
          { type: "text", text: "お疲れ様です！よく頑張りました！" }
        else
          Api::Line::Events::Messages::ErrorText.new.execute
        end

      uid = OmniauthProfile.find_by(user_id: user.id).uid
      client.push_message(uid, push_message)
      head :ok
    end

    private

    def client
      case Rails.env
      when "development"
        ::Line::Bot::Client.new { |config|
          config.channel_secret = Settings.line.messaging_api.channel_secret
          config.channel_token = Settings.line.messaging_api.channel_token
        }
      else
        ::Line::Bot::Client.new { |config|
          config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
          config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
        }
      end
    end
  end
end
