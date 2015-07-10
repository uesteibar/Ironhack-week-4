class Concert < ActiveRecord::Base
  validates_presence_of :band, :venue, :city, :price, :date, :description
end
