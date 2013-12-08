class CreateCurrentProject < ActiveRecord::Migration
  def change
    create_table :current_project do |t|
      t.integer :user_id
      t.integer :project_id
      t.text :description
      t.boolean :completed

      t.timestamps
    end
  end
end
