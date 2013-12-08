class ProjectsController < ApplicationController
		# load_and_authorize_resource
		require 'will_paginate/array'

	def show
		@project = Project.find(params[:id])
	end

	def index
		@projects = Project.paginate(:page => params[:page], :per_page => 5)
	end

	def my_projects
		@projects = project = Project.paginate(:page => params[:page], :per_page => 5)
		# @projects.each do |project|
		# 	if current_user.id == project.user_id
		# 			puts project
		# 	else
		# 		puts "You don't have any open projects. Create one!"
		# 	end
		# end
	end

	def new
		@project = Project.new
		@project.user_id= params[:user_id]
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
		@project.destroy

		# Need to add redirect route to nonprofit home page
		redirect_to projects_path
	end

	def apply_for_project
	end

	private

	def projects_params
		params.require(:project).permit(:title, :describe, :project_requirement, :category, :project_deadline, :user_id)
	end

end