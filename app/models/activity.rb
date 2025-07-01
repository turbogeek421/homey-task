class Activity < ApplicationRecord
  before_create :assign_uuid_id

  belongs_to :project
  belongs_to :user
  belongs_to :record, polymorphic: true, dependent: :destroy
end
