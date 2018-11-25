require "rails_helper"

MESSAGE_TEXT_PARAMS = {
  "events"=>[
    {
      "type"=>"message",
      "replyToken"=>"b1d8bd1903f144378f452bc78b4f53ff",
      "source"=> {
        "userId"=>"xxxxxxxxx",
        "type"=>"user"
      },
      "timestamp"=>1542212801054,
      "message"=>{
        "type"=>"text",
        "id"=>"8863567885824",
        "text"=>"test"
       }
     }
   ]
  }.freeze

MESSAGE_IMAGE_PARAMS = {
  "events"=>[
    {
      "type"=>"message",
      "replyToken"=>"18abc860c89c4b4a9b240e010df18126",
      "source"=>{
        "userId"=>"xxxxxxxxx",
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
  ]
}.freeze

MESSAGE_STICKER_PARAMS = {
  "events"=>[
    {
      "type"=>"message",
      "replyToken"=>"18abc860c89c4b4a9b240e010df18126",
      "source"=>{
        "userId"=>"xxxxxxxxx",
        "type"=>"user"
      },
      "timestamp"=>1542213286231,
      "message"=>{
        "type": "sticker",
        "packageId": "1",
        "stickerId": "1"
      }
    }
  ]
}.freeze

MESSAGE_TEXT_DIARY_PARAMS = {
  "events"=>[
    {
      "type"=>"message",
      "replyToken"=>"b1d8bd1903f144378f452bc78b4f53ff",
      "source"=> {
        "userId"=>"xxxxxxxxx",
        "type"=>"user"
      },
      "timestamp"=>1542212801054,
      "message"=>{
        "type"=>"text",
        "id"=>"8863567885824",
        "text"=>"日記頑張った"
       }
     }
   ]
  }.freeze

FOLLOW_EVENT_PARAMS = {
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
  ]
}.freeze

RSpec.describe "Api/Lines", type: :request do
  context "callback action does not exist profile" do
    before do
      allow_any_instance_of(::Line::Bot::Client).to receive(:validate_signature).and_return(true)
    end
    it "message text" do
      expect do
        post api_line_callback_path, params: MESSAGE_TEXT_PARAMS
      end.to change(
        Profile, :count
      ).by(1)
    end

    it "message image" do
      expect do
        post api_line_callback_path, params: MESSAGE_IMAGE_PARAMS
      end.to change(
        Profile, :count
      ).by(1)
    end

    it "message sticker" do
      expect do
        post api_line_callback_path, params: MESSAGE_STICKER_PARAMS
      end.to change(
        Profile, :count
      ).by(1)
    end

    it "message diary text" do
      create(:user, id: 1)
      create(:omniauth_profile, uid: "xxxxxxxxx", user_id: 1)
      expect do
        post api_line_callback_path, params: MESSAGE_TEXT_DIARY_PARAMS
      end.to change(
        Profile, :count
      ).by(1).and change(
        Nikki, :count
      ).by(1)
    end

    it "follow event" do
      expect do
        post api_line_callback_path, params: FOLLOW_EVENT_PARAMS
      end.to change(
        Profile, :count
      ).by(1)
    end
  end
end