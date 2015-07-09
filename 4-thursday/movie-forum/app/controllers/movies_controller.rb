class MoviesController < ApplicationController
  def index
    @movies = MovieRetriever.new.find(params[:term])
  end

  def search
  end
end
