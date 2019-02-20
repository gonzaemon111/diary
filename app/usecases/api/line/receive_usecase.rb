module Api
  module Line
    class ReceiveUsecase < Api::Line::BaseUsecase
      def initialize(request, params)
        @request = request
        @params = params
        @client ||= client
      end

      def execute
        body = @request.body.read

        signature = @request.env["HTTP_X_LINE_SIGNATURE"]

        unless @client.validate_signature(body, signature)
          error 400 do "Bad Request" end
        end

        # events = @client.parse_events_from(body)

        @params["events"].each { |event|
          profiles = []
          profile = Profile
                      .where(uid: event["source"]["userId"])
                      .where(provider: 0)
                      .first

          unless profile.present?
            new_profile = Profile.create!(uid: event["source"]["userId"], provider: 0)
            profiles.push new_profile
          end
          result = Api::Line::Events::BaseFactory.new(event, @client).execute
          return false unless result
        }
        true
      end

      private

      def client
        ::Line::Bot::Client.new { |config|
          config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
          config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
        }
      end
    end
  end
end
