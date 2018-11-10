FactoryBot.define do
  factory :user do
    name                  { "test" }
    email                 { "test1@test.com" }
    password              { "hogehoge" }
    sign_in_count         { 0 }
    failed_attempts       { 0 }
  end
end
