
class MovieRetriever
  def initialize(secondary_retriever = ImdbAdapter.new)
    @secondary_retriever = secondary_retriever
  end

  def find(term)
    movies = Movie.where("UPPER(title) LIKE UPPER('%#{term}%')")
    return movies unless movies.blank?
    load_from_secondary_retriever(term)
  end

  def load_from_secondary_retriever(term)
    @secondary_retriever.find(term)
  end
end
