class Comment < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  validates_presence_of :user_id, :content
end
