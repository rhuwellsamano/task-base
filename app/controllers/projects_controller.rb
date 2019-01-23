class ProjectsController < ApplicationController
  before_action :current_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
    # @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)

    redirect_to project_path(@project)
  end

  def edit
    # @project = project.find(params[:id])
  end

  def update
    # @project = project.find(params[:id])
    @project.update

    redirect_to project_path(@project)
  end

  def destroy
    # @project = project.find(params[:id])
    @project.destroy

    redirect_to projects_path
  end

private
  def project_params
    params.require(:project).permit(:name, :slogan)
  end

# ADD THE FOLLOWING PRIVATE METHOD/ACTION BELOW

  def current_project
    @project = Project.find(params[:id])
  end


end
