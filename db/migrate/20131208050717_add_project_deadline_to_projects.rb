class AddProjectDeadlineToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_deadline, :date
  end
end
