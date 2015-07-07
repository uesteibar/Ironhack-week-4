class UrlRedirecter
  def initialize(url)
    @url = url
  end

  def redirect
    @url.visited_at = Time.now
    @url.times_visited += 1
    @url.save
    @url.url
  end
end
