class ProjectsController < ApplicationController
  before_action :current_project, only: [:show, :edit, :update, :destroy]
  after_action :userproject_join, only: [:create]

  def index
    @projects = Project.all
    @project = Project.new
    @user = current_user
    @users = User.all
    @userprojects = UserProject.all
  end

  def new
    @project = Project.new
    @project.tasks.build(name: "New Task", status: "Created New Task")
  end

  def create
    @project = Project.create(project_params)
    # UserProject.create(user_id: @user.id, @project.id)

    redirect_to project_path(@project)
  end

################ TO FUSE INTO ABOVE SOMEHOW?.. ######
#   def create
#   @post = current_user.posts.build(post_params)
#   if @post.save
#     if params[:images]
#       params[:images].each do |img|
#         @post.photos.create(image: img)
#       end
#     end
#
#      redirect_to posts_path
#     flash[:notice] = "Saved ..."
#   else
#     flash[:alert] = "Something went wrong ..."
#     redirect_to posts_path
#   end
# end

  def show
    # @project = Project.find(params[:id])
    @users = User.all
    @tasks = @project.tasks
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
      :id,
      :name,
      :status
      ]
    )
  end

  def current_project
    @project = Project.find(params[:id])
  end

 def userproject_join
   UserProject.create(user_id: current_user.id, project_id: @project.id)
 end


end
