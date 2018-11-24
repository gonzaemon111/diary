web: bundle exec rails s -p $PORT -e $RAILS_ENV
sidekiq: mkdir -p tmp/pids && bundle exec sidekiq -C config/sidekiq.yml && bundle exec unicorn -p $PORT -c ./config/unicorn.rb