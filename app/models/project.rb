class Project < ActiveRecord::Base
	resourcify
	belongs_to :user
	include Authority::Abilities
	
end
