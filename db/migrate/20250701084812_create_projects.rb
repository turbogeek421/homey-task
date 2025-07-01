class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects, id: :string do |t|
      t.timestamps
      t.string :title
    end
  end
end
