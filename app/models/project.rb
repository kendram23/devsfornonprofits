class Project < ActiveRecord::Base
	resourcify
	belongs_to :user
	
end
