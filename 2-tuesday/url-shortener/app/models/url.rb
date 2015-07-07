class Url < ActiveRecord::Base
  validates_presence_of :shortcut, :url
  validates_uniqueness_of :shortcut, :url
  validates_format_of :url, :with => URI.regexp(['http'])

  before_validation :complete_url

  private

  def complete_url
    UrlCompleter.new(url).complete
  end
end
