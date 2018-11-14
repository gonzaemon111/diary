# Diary
Things you may want to cover:

* Ruby version

```
  2.5.1
```

* Rails version

```
  5.2.1
```

* Database creation

  MySQL ver 8.0.12

* Database initialization

```
  $ bundle exec rails db:create
  $ bundle exec rails db:migrate
```

* How to run the test suite

  RSpec, rubocop

* Services (job queues, cache servers, search engines, etc.)

  cache : redis

* Deployment instructions

  Heroku


* 開発

  一時的な外部サーバ : ngrok
  ```
  $ brew install ngrok
  $ brew cask install ngrok (上がダメなら)
  ```

  ```
  $ ngrok http 3000
  ```
  
* Sidekiq

  ```
  $ bundle exec sidekiq -C config/sidekiq.yml
  ```
  
* test

  ```
  $ bundle exec rspec spec/.
  $ bundle exec rubocop -a
  ```
