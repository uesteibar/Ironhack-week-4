class MoviesController < ApplicationController
  def index
    @movies = Movie.where("UPPER(title) LIKE UPPER('%#{params[:term]}%')")
  end

  def search
  end
end
