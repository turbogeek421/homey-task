class CreateActivities < ActiveRecord::Migration[7.2]
  def change
    create_table :activities, id: :string do |t|
      t.timestamps
      t.string :project_id
      t.string :user_id
      t.string :record_type
      t.string :record_id
    end
    add_index :activities, :project_id
    add_index :activities, :user_id
  end
end
