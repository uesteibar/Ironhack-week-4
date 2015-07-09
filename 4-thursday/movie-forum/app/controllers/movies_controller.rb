class MoviesController < ApplicationController
  def index
    @movies = MovieRetriever.new.find(params[:term])
  end

  def search
  end

  def create
    movie = Movie.new(movie_params)
    if movie.valid?
      movie.save
      redirect_to action: "search"
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :synopsis, :year)
  end
end
