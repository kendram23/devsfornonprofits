class Project < ActiveRecord::Base
	resourcify
	belongs_to :user
	has_many :current_projects
	
end
