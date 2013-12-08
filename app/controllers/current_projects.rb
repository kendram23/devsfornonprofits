class CurrentProjectsController < ApplicationController
  
  def show
  	@currentproject = CurrentProject.find(:id)
  end

  def index
  	@currentprojects = CurrentProject.all?
  end

  def new
  	@currentproject = CurrentProject.new
  end

  def create
  	@currentproject = CurrentProject.create(cp_params)
  	redirect_to project_path
  end


  private

  def cp_params
  	params.require(:currentproject).permit(:user_id, :project_id, :description)
  end
end