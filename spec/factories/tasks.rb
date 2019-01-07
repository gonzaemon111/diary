FactoryBot.define do
  factory :task do
    association :user, factory: :user
    value { "MyString" }
    date_time { "2019-01-05 23:44:12" }
    is_done { false }
  end
end
