class ProjectsController < ApplicationController
		load_and_authorize_resource :class => Project
		include Authority::UserAbilities

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
		# Need to add a redirct path to project show page
		redirect_to root_path
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		@project.update(params)

		# Need to add redirect route to project show page
		redirect_to
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy(params)

		# Need to add redirect route to nonprofit home page
		redirect_to
	end

end