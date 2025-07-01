class Project < ApplicationRecord
  before_create :assign_uuid_id
end
