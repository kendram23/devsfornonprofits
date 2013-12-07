class Ability
	include CanCan::Ability

	def initialize(user)
		user ||= User.new # guest user -- not logged in
		user.roles.each { |role| send(role) }

		# Using CRUD alias for nonprofit user
		alias_action :create, :read, :update, :destroy, :to=> :crud

		if user.roles.size == 0
			# Need to add what the guest user can do here
			# Probably nothing, maybe see static pages
		end
	end

	def admin
		can :manage, :all
	end

	# Sets the nonprofit role
	#
	# Nonprofits can manage all CRUD actions
	# Active - sets CRUD actions to only active projects of that user

	def nonprofit
		can :crud, Project, :active => true, :user_id => user.id
	end

	def developer
		can :read, Project
	end
end

