class AddsStatusToProjects < ActiveRecord::Migration[7.2]
  def change
    add_column :projects, :status, :integer
  end
end
