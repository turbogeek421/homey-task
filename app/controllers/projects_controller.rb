class ProjectsController < ApplicationController
  def index
    project = Project.first

    if project
      redirect_to project_path(project)
    else
      render plain: "Run database seed:\n\n  rails db:seed"
    end
  end

  def show
    @project = Project.find_by(id: params[:id])
    @activities = @project.activities.order(created_at: :desc)
  end
end
