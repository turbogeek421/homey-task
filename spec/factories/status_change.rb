FactoryBot.define do
  factory :status_change do
    from_status { 'new' }
    to_status { 'pending' }
  end
end
