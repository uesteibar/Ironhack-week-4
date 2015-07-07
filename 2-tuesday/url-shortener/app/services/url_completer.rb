class UrlCompleter
  def initialize(url)
    @url = url
  end

  def complete
    unless @url.starts_with?("http://") || @url.starts_with?("https://")
      @url.insert(0, "http://")
    end
  end
end
