FactoryBot.define do
  factory :user do
    name { Faker::FunnyName.unique.name }

    trait :with_activities do
      activities { build_list :activity, 3 }
    end
  end
end
