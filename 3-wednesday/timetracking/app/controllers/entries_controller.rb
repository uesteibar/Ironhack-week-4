class EntriesController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @entries = @project.month_entries
  end

  def new
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new
  end

  def create
    @project = Project.find(params[:project_id])
    @project.entries.create(entry_params)
    redirect_to action: "index", project_id: @project.id
  end

  private

  def entry_params
    params.require(:entry).permit(:date, :hours, :minutes)
  end
end
