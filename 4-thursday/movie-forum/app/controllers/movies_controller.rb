class MoviesController < ApplicationController
  def index
    @movies = MovieRetriever.new.find(params[:term])
  end

  def show
    @movie = Movie.find(params[:id])
    @comment = @movie.comments.new
  end

  def search
  end

  def create
    movie = Movie.new(movie_params)
    if movie.valid?
      movie.save
      redirect_to action: "show", id: movie.id
      return
    end
    redirect_to action: "index"
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :synopsis, :year)
  end
end
