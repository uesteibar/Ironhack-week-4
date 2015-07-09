class Movie < ActiveRecord::Base
  has_many :comments

  validates_presence_of :title, :synopsis, :year
  validates_uniqueness_of :title
end
