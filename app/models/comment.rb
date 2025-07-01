class Comment < ApplicationRecord
  before_create :assign_uuid_id

  has_one :activity, as: :record, dependent: :destroy
end
