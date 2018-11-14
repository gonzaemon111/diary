web: bundle exec rails s -p $PORT -e $RAILS_ENV
worker: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
sidekiq: mkdir -p tmp/pids && bundle exec sidekiq -C config/sidekiq.yml