class User < ActiveRecord::Base
  has_many :comments

  validates_presence_of :username, :password
end
