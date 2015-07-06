class ProjectsController < ApplicationController
  def index
    @projects = Project.last_created(10)
  end
end
