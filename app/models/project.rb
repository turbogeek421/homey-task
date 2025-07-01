class Project < ApplicationRecord
  before_create :assign_uuid_id

  has_many :activities

  enum status: { pending: 0, accepted: 1, in_progress: 2, completed: 3 }
end
