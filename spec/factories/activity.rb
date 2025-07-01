FactoryBot.define do
  factory :activity do
    association :project
    association :user
    association :record, factory: :comment
  end
end
