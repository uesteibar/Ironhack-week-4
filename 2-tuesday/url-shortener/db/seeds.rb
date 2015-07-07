
urls = [
  "http://github.com",
  "http://medium.com",
  "http://google.com"
]

urls.each do |url|
  Url.create(shortcut: StringShortcutGenerator.new(6).generate, url: url)
end
