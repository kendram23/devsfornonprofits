class Project < ActiveRecord::Base
	resourcify
	belongs_to :user
	has_many :current_projects
	
	def current_project_applicants(id)
	x = CurrentProject.find(id)
		x.each do |list|
			if list.id == @project.id
			end
		end
	end
end
