class StatusChangesController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @status_change = StatusChange.new(status_change_params.merge(from_status: "current status"))

    if @status_change.save
      Activity.create!(project: @project, user: User.first, record: @status_change)
      redirect_to @project, notice: "Status change was successfully created."
    else
      flash.now[:alert] = "Status change could not be created."
      render "projects/show", status: :unprocessable_entity
    end
  end

  private

  def status_change_params
    params.require(:status_change).permit(:to_status)
  end
end
