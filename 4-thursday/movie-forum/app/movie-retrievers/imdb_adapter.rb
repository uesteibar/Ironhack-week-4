
class ImdbAdapter
  def find(term, limit = 10)
    movies_imdb = Imdb::Search.new(term).movies.slice(0, limit)
    movies_imdb.map do |movie|
      Movie.new(
        title: movie.title,
        synopsis: movie.plot_summary,
        year: movie.year
      )
    end
  end
end
