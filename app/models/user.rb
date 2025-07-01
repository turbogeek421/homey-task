class User < ApplicationRecord
  before_create :assign_uuid_id

  has_many :activities
end
