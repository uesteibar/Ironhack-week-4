class Movie < ActiveRecord::Base
  validates_presence_of :title, :synopsis, :year
  validates_uniqueness_of :title
end
