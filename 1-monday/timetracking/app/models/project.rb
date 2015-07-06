
class Project < ActiveRecord::Base
  validates_presence_of :name, uniqueness: true

  def self.iron_find(date = Date.current)
    where("created_at > ?", date).order(:name).limit(10)
  end

  def self.clean_old(date = 1.week.ago)
    where("created_at < ?", date).destroy_all
  end

end
