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
    @entry = @project.entries.new(entry_params)
    if @entry.valid?
      @entry.save
      redirect_to action: "index", project_id: @project.id
    else
      render :new
    end

  end

  private

  def entry_params
    params.require(:entry).permit(:date, :hours, :minutes)
  end
end
