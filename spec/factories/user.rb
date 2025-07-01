FactoryBot.define do
  factory :user do
    name { Faker::FunnyName.unique.name }
  end
end
