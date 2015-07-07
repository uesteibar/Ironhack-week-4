
urls = [
  "http://github.com",
  "http://medium.com",
  "http://google.com"
]

urls.each_with_index do |url, i|
  Url.create(shortcut: i, url: url)
end
