FactoryBot.define do
  factory :omniauth_profile do
    association :user, factory: :user
    uid { "MyString" }
    name { "MyString" }
    provider { 0 }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, "public/images/book.png")) }
    description { "MyString" }
    email { "MyString" }
    token { "MyString" }
    refresh_token { "MyString" }
    created_at { Faker::Time.between(5.days.ago, 3.days.ago, :all) }
    updated_at { Faker::Time.between(2.days.ago, 1.days.ago, :all) }
  end
end
