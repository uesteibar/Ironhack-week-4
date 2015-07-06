
class Project < ActiveRecord::Base
  validates_presence_of :name, uniqueness: true

  def self.iron_find(date = Date.current)
    where("created_at > ?", date).order(:name).limit(10)
  end

  def self.clean_old(date = 1.week.ago)
    where("created_at < ?", date).destroy_all
  end

  def self.last_created(limit)
    order(created_at: :desc).limit(limit)
  end
end
