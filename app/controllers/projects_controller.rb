class ProjectsController < ApplicationController
  before_action :current_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @project.tasks.build(name: "New Task", status: "Created New Task")
  end

  def create
    @project = Project.create(project_params)

    redirect_to project_path(@project)
  end

  def show
    # @project = Project.find(params[:id])
    @users = User.all
  end

  def edit
    # @project = project.find(params[:id])
  end

  def update
    # @project = project.find(params[:id])
    @project.update(project_params)

    # NEED TO FIGURE OUT HOW TO UPDATE PROJECT TASKS - TASK PARAMS?
    # MAYBE ADD SOMETHING TO PROJECT_PARAMS BELOW?

    redirect_to project_path(@project)
  end

  def destroy
    # @project = project.find(params[:id])
    @project.destroy

    redirect_to projects_path
  end

private
  def project_params
    params.require(:project).permit(:title, :description, tasks_attributes: [
      :name,
      :status
      ]
    )
  end

# ADD THE FOLLOWING PRIVATE METHOD/ACTION BELOW

  def current_project
    @project = Project.find(params[:id])
  end


end
