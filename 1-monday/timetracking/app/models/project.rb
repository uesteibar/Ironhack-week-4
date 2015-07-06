
class Project < ActiveRecord::Base
  def self.iron_find(date = Date.current)
    where("created_at > ?", date).order(:name).limit(10)
  end
end
