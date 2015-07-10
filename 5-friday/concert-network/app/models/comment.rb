class Comment < ActiveRecord::Base
  belongs_to :concert

  validates_presence_of :username, :content
end
