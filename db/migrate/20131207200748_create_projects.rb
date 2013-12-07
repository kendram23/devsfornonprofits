class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.date :project_deadlin
      t.string :category
      t.boolean :completed
      t.integer :user_id

      t.timestamps
    end
  end
end
