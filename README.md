# Diary

[![codecov](https://codecov.io/gh/gonzaemon111/diary/branch/master/graph/badge.svg)
(https://codecov.io/gh/gonzaemon111/diary)

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
  
* Redis
https://qiita.com/sawa-@github/items/1f303626bdc219ea8fa1

```
  redisサーバーの立ち上げ
  $ redis-server /usr/local/etc/redis.conf

  redis に入る
  $  redis-cli
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


### Followイベント

```
{
  "events"=>[
    {
      "type"=>"follow",
      "replyToken"=>"5c24eb5d27ca4cba834681205c92542a",
      "source"=>{
        "userId"=>"Ud01d8e3648823376d3f5ba6c6345d392",
        "type"=>"user"
       },
       "timestamp"=>1542288602614
    }
  ],
  "destination"=>"Ueaafc8e4e9a87d8115d77e2198cad696",
  "line"=>{
    "events"=>[
      {
        "type"=>"follow",
        "replyToken"=>"5c24eb5d27ca4cba834681205c92542a",
        "source"=>{
          "userId"=>"Ud01d8e3648823376d3f5ba6c6345d392",
          "type"=>"user"
        },
        "timestamp"=>1542288602614
      }
    ],
    "destination"=>"Ueaafc8e4e9a87d8115d77e2198cad696"
  }
}

```

### Unfollowイベント

```
{
  "events"=>[
    {
      "type"=>"unfollow",
      "source"=>{
        "userId"=>"Uf126f218c4dc369b22563edd91e0c09a",
        "type"=>"user"
      },
      "timestamp"=>1542358314849
    }
  ],
  "destination"=>"Ueaafc8e4e9a87d8115d77e2198cad696",
  "line"=>{
    "events"=>[
      {
        "type"=>"unfollow",
        "source"=>{
          "userId"=>"Uf126f218c4dc369b22563edd91e0c09a",
          "type"=>"user"
        },
        "timestamp"=>1542358314849
      }
    ],
    "destination"=>"Ueaafc8e4e9a87d8115d77e2198cad696"
  }
}
```

### Postbackイベント

```
{
  "events"=>[
    {
      "type"=>"postback",
      "replyToken"=>"60d73c659c0c471388764245ea39f430",
      "source"=>{
        "userId"=>"Uf126f218c4dc369b22563edd91e0c09a",
        "type"=>"user"
      },
      "timestamp"=>1542357622381,
      "postback"=>{
        "data"=>"no"
      }
    }
  ],
  "destination"=>"Ueaafc8e4e9a87d8115d77e2198cad696",
  "line"=>{
    "events"=>[
      {
        "type"=>"postback",
        "replyToken"=>"60d73c659c0c471388764245ea39f430",
        "source"=>{
          "userId"=>"Uf126f218c4dc369b22563edd91e0c09a",
          "type"=>"user"
        },
        "timestamp"=>1542357622381,
        "postback"=>{
          "data"=>"no"
        }
      }
    ],
    "destination"=>"Ueaafc8e4e9a87d8115d77e2198cad696"
  }
}
```
