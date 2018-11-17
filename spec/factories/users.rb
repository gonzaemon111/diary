FactoryBot.define do
  factory :user do
    name                  { "test" }
    email                 { "test1@test.com" }
    password              { "hogehoge" }
    sign_in_count         { 0 }
    failed_attempts       { 0 }
    created_at { Faker::Time.between(5.days.ago, 3.days.ago, :all) }
    updated_at { Faker::Time.between(2.days.ago, 1.days.ago, :all) }
  end
end
