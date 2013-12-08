class RemoveProjectDeadlinFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :project_deadlin, :date
  end
end
