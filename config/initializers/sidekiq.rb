Sidekiq.configure_server do |config|
  config.redis = case Rails.env
                 when "production"
                   { url: ENV["REDIS_URL"], namespace: "test_sidekiq" }
                 else
                   { url: "redis://localhost:6379", namespace: "test_sidekiq" }
                 end
end

Sidekiq.configure_client do |config|
  config.redis = case Rails.env
                 when "production"
                   { url: ENV["REDIS_URL"], namespace: "test_sidekiq" }
                 else
                   { url: "redis://localhost:6379", namespace: "test_sidekiq" }
                 end
end
