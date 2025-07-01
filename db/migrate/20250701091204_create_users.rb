class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users, id: :string do |t|
      t.timestamps
      t.string :name
    end
  end
end
