class Url < ActiveRecord::Base
  validates_presence_of :shortcut, :url, unique: true
  validates_format_of :url, :with => URI.regexp(['http'])

  before_validation :complete_url

  private

  def complete_url
    unless url.starts_with?("http://") || url.starts_with?("https://")
      url.insert(0, "http://")
    end
  end
end
