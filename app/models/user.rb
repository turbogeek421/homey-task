class User < ApplicationRecord
  before_create :assign_uuid_id
end
