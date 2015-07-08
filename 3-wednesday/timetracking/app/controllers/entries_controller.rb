class EntriesController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @entries = @project.month_entries
  end
end
