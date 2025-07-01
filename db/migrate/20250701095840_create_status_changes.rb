class CreateStatusChanges < ActiveRecord::Migration[7.2]
  def change
    create_table :status_changes, id: :string do |t|
      t.timestamps
      t.string :from_status
      t.string :to_status
    end
  end
end
