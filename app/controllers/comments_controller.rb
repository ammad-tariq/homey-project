# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project

  def create
    @comment = @project.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @project, notice: 'Comment was successfully added.'
    else
      render "projects/show"
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
