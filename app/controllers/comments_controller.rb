class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @comment = Comment.new(comment_params)

    if @comment.save
      Activity.create!(project: @project, user: User.first, record: @comment)
      redirect_to @project, notice: "Comment was successfully created."
    else
      flash.now[:alert] = "Comment could not be created."
      render "projects/show", status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content) # Permit only the 'content' attribute
  end
end
