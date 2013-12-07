class Project < ActiveRecord::Base
	load_and_authorize_resource

	def show
		@project = Project.find(params[:id])
	end

	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.create(params)

########################################
		# Need to add a redirct path based on user role!!!!
		redirect_to root_path
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		@project.update(params)

		# Need to add redirect route based on user type
		redirect_to
	end

	def destroy
		@project = Project.find(params[:id])
		@project.update(params)

		# Need to add redirect route based on user type
		redirect_to
	end
end
