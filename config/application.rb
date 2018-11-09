require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "slack"

Bundler.require(*Rails.groups)

Dotenv::Railtie.load

module Diary
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = ENV["TZ"]

    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: false,
                       request_specs: true
      g.fixture_replacement :factory_bot, dir: "spec/factories"
      g.helper false
    end
    config.generators.system_tests = nil
  end
end
