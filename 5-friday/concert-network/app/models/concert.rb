class Concert < ActiveRecord::Base
  has_many :comments

  has_attached_file :poster, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :poster, :content_type => /\Aimage\/.*\Z/

  validates_presence_of :band, :venue, :city, :price, :date, :description
end
