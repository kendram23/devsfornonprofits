class Ability
    include CanCan::Ability

    def initialize(user)
        user ||= User.new # guest user -- not logged in
        
        if user.role? :admin
            can: manage, :all?
        end

        alias_action :create, :read, :update, :destroy, :to=> :crud
        
        # Sets the nonprofit role
        #
        # Nonprofits can manage all CRUD actions
        # Active - sets CRUD actions to only active projects of that user

        if user.role? "developer"
            can :read, Project
            can :crud, User, :active => true, :user_id => user.id
        end

        if user.role == 'nonprofit'
            can :crud, Project, :active => true, :user_id => user.id
            can :crud, User, :active => true, :user_id => user.id
        end

        # Using CRUD alias for nonprofit user
    end

end

