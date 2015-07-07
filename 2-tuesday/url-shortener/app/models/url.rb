class Url < ActiveRecord::Base
  validates_presence_of :shortcut, :url, unique: true
end
