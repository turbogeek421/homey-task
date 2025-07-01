FactoryBot.define do
  factory :project do
    title { Faker::Lorem.sentence(word_count: 4) }
    status { :pending }

    trait :with_activities do
      activities { build_list :activity, 3 }
    end
  end
end
