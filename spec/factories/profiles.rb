FactoryBot.define do
  factory :profile do
    uid { "MyString" }
    provider { 0 }
    created_at { Faker::Time.between(5.days.ago, 3.days.ago, :all) }
    updated_at { Faker::Time.between(2.days.ago, 1.days.ago, :all) }
  end
end
