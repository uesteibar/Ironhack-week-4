class Url < ActiveRecord::Base
  validates_presence_of :shortcut, :url
  validates_uniqueness_of :shortcut, :url
  validates_format_of :url, :with => URI.regexp(['http'])

  before_validation :complete_url
  before_validation :shorten_url, only: :create

  private

  def complete_url
    self.url = UrlCompleter.new(url).complete
  end

  def shorten_url
    shortcut = StringShortcutGenerator.new(6).generate
  end
end
