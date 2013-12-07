class Ability
	include CanCan:Ability

	def initialize(user)
		user ||= User.new # guest user -- not logged in
		if user.admin?
			can: manage, :all
		elsif user.nonprofit?


		elsif user.developer?

		else
			can :read, :all
		end
	end
end