require "line/bot"

module Api
  module Line
    module Events
      class BaseFactory
        def initialize(event, client)
          @event = event
          @client = client
        end

        def execute
          case @event["type"]
          when "postback"
            Api::Line::Events::Postbacks::Base.new(@event, @client).execute
          when "leave"
            Api::Line::Events::Leaves::Base.new(@event, @client).execute
          when "follow"
            Api::Line::Events::Follows::Base.new(@event, @client).execute
          when "unfollow"
            Api::Line::Events::Unfollows::Base.new(@event, @client).execute
          when "join"
            Api::Line::Events::Joins::Base.new(@event, @client).execute
          when "beacon"
            Api::Line::Events::Beacons::Base.new(@event, @client).execute
          when "message"
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