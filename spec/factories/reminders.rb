FactoryBot.define do
  factory :reminder do
    association :user, factory: :user
    is_finished { false }
    value { "test" }
    execute_time { Faker::Time.between(5.days.ago, 3.days.ago, :all) }
    created_at { Faker::Time.between(5.days.ago, 3.days.ago, :all) }
    updated_at { Faker::Time.between(2.days.ago, 1.days.ago, :all) }
  end
end
