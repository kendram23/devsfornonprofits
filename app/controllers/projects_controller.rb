class ProjectsController < ApplicationController
		# load_and_authorize_resource
	require 'will_paginate/array'
	before_filter :require_login

	def show
		@project = Project.find(params[:id])
	end

	def index
		@projects = Project.paginate(:page => params[:page], :per_page => 10)
	end

	# def my_projects
	# 	if current_user
	# 		@projects = project = Project.paginate(:page => params[:page], :per_page => 5)
	# 	else
	# 		redirect_to root_path
	# 	end
	# end

	def new
		@project = Project.new
		@project.user_id= params[:user_id]
	end

	def create
		@project = Project.create(projects_params)

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
			params.require(:project).permit(:title, :description, :requirements, :category, :project_deadline, :user_id)
		end

    def require_login
      unless current_user
        redirect_to root_path
      end
    end

end