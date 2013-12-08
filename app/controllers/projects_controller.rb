class ProjectsController < ApplicationController
		# load_and_authorize_resource
		require 'will_paginate/array'

	def show
		@project = Project.find(params[:id])
	end

	def index
		@projects = Project.paginate(:page => params[:page], :per_page => 5)
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.create(projects_params)

########################################
		# Need to add a redirct path to project show page
		redirect_to @project
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		@project.update(projects_params)

		# Need to add redirect route to project show page
		redirect_to @project
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy(params)

		# Need to add redirect route to nonprofit home page
		redirect_to @projects
	end

	def apply_for_project
	end

	private

	def projects_params
		params.require(:project).permit(:title, :describe, :project_requirement, :category, :project_deadline)
	end

end