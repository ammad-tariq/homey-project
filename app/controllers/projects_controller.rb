class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update]

  def index
    @projects = Project.order(created_at: :asc) # Order by creation date
  end

  def show
    @comments = @project.comments.order(created_at: :asc)
    @status_changes = @project.status_changes.order(created_at: :asc)
    @conversation_history = (@comments + @status_changes).sort_by(&:created_at)
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    previous_status = @project.status_before_type_cast
    if @project.update(project_params)
      new_status = @project.status_before_type_cast
      StatusChange.create!(
        project: @project,
        user: current_user,
        from_status: previous_status,
        to_status: new_status
      )
      redirect_to @project, notice: 'Project status was successfully updated.'
    else
      render :show
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :status)
  end
end
