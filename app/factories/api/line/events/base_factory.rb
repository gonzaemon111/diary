require "line/bot"

module Api
  module Line
    module Events
      class BaseFactory
        def initialize(event, client)
          Rails.logger.debug "yここあで"
          @event = event
          @client = client
        end

        def execute
          case @event["type"]
          when ::Line::Bot::Event::Postback
            Api::Line::Events::Postbacks::Base.new(@event, @client).execute
          when ::Line::Bot::Event::Leave
            Api::Line::Events::Leaves::Base.new(@event, @client).execute
          when ::Line::Bot::Event::Follow
            Api::Line::Events::Follows::Base.new(@event, @client).execute
          when ::Line::Bot::Event::Unfollow
            Api::Line::Events::Unfollows::Base.new(@event, @client).execute
          when ::Line::Bot::Event::Join
            Api::Line::Events::Joins::Base.new(@event, @client).execute
          when ::Line::Bot::Event::Beacon
            Api::Line::Events::Beacons::Base.new(@event, @client).execute
          when "message"
            Rails.logger.debug "ここやで"
            Api::Line::Events::Messages::Base.new(@event, @client).execute
          else
            return false
          end
          true
        end
      end
    end
  end
end