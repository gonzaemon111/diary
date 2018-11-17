FactoryBot.define do
  factory :nikki do
    association :user, factory: :user
    value { "MyString" }
    datetime { "2018-11-05 20:46:57" }
  end
end
