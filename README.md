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


## LineBotAPIの使い方

Message::Textの場合
```
{
  "events"=>[
    {
      "type"=>"message",
      "replyToken"=>"b1d8bd1903f144378f452bc78b4f53ff",
      "source"=> {
        "userId"=>"Uf126f218c4dc369b22563edd91e0c09a",
        "type"=>"user"
      },
      "timestamp"=>1542212801054,
      "message"=>{
        "type"=>"text",
        "id"=>"8863567885824",
        "text"=>"んsmzk"
       }
     }
   ],
   "destination"=>"Ueaafc8e4e9a87d8115d77e2198cad696",
   "line"=>{
   　　"events"=>[
     {
     　　"type"=>"message",
      "replyToken"=>"b1d8bd1903f144378f452bc78b4f53ff",
      "source"=>{
      　　"userId"=>"Uf126f218c4dc369b22563edd91e0c09a",
        "type"=>"user"
      },
      "timestamp"=>1542212801054,
      "message"=>{
      　　"type"=>"text",
       "id"=>"8863567885824",
       "text"=>"んsmzk"
     　}
    }
   ],
   "destination"=>"Ueaafc8e4e9a87d8115d77e2198cad696"
   }
  }
```
### Message::Image
```
{
  "events"=>[
    {
      "type"=>"message",
      "replyToken"=>"18abc860c89c4b4a9b240e010df18126",
      "source"=>{
        "userId"=>"Uf126f218c4dc369b22563edd91e0c09a",
        "type"=>"user"
      },
      "timestamp"=>1542213286231,
      "message"=>{
        "type"=>"image",
        "id"=>"8863586432435",
        "contentProvider"=>{
          "type"=>"line"
        }
      }
    }
  ],
  "destination"=>"Ueaafc8e4e9a87d8115d77e2198cad696",
  "line"=>{
    "events"=>[
      {
        "type"=>"message",
        "replyToken"=>"18abc860c89c4b4a9b240e010df18126",
        "source"=>{
          "userId"=>"Uf126f218c4dc369b22563edd91e0c09a",
          "type"=>"user"
        },
        "timestamp"=>1542213286231,
        "message"=>{
          "type"=>"image",
          "id"=>"8863586432435",
          "contentProvider"=>{
            "type"=>"line"
          }
        }
      }
    ],
    "destination"=>"Ueaafc8e4e9a87d8115d77e2198cad696"
  }
}
```
