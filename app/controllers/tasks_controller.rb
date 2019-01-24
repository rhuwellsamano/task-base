class TasksController < ApplicationController
  before_action :current_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
    @projects = Project.all
  end

  def create
    @task = Task.create(task_params)

    redirect_to task_path(@task)
  end

  def show
    # @task = Task.find(params[:id])
    # @users = User.all
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def update
    # @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

private
  def task_params
    params.require(:task).permit(:name, :status, :project_id)
  end

# ADD THE FOLLOWING PRIVATE METHOD/ACTION BELOW

  def current_task
    @task = Task.find(params[:id])
  end


end
