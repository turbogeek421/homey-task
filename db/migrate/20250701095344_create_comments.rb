class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments, id: :string do |t|
      t.timestamps
      t.string :content
    end
  end
end
