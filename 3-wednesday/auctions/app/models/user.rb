class User < ActiveRecord::Base
  has_many :products
  has_many :bids

  validates_uniqueness_of :email

end
