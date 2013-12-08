class CreateCurrentProjects < ActiveRecord::Migration
  def change
    create_table :current_projects do |t|
      t.integer :user_id
      t.integer :project_id
      t.text :description
      t.boolean :completed

      t.timestamps
    end
  end
end
