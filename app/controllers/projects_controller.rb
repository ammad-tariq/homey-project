# app/controllers/projects_controller.rb
class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :update]

  def index
    @projects = Project.all
  end

  def show
    @comments = @project.comments.order(created_at: :asc)
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :index
    end
  end

  def update
    @project.previous_status = @project.status
    if @project.update(project_params)
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
