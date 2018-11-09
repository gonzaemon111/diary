FactoryBot.define do
  factory :user do
    name                  { "test" }
    email                 { "test@test.com" }
    password              { "hogehoge" }
    password_confirmation { "hogehoge" }
    sign_in_count         { 0 }
    failed_attempts       { 0 }
  end
end
