FactoryBot.define do
  factory :project do
    title { Faker::Lorem.sentence(word_count: 4) }
  end
end
