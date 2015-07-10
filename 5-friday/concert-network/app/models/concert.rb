class Concert < ActiveRecord::Base
  has_many :comments

  validates_presence_of :band, :venue, :city, :price, :date, :description
end
