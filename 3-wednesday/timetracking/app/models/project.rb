
class Project < ActiveRecord::Base
  has_many :entries

  validates_presence_of :name
  validates_uniqueness_of :name

  def total_hours_in_month(month = Date.current.month, year = Date.current.year)
    return if year.nil?
    return if month.nil? || month > 12 || month < 1

    subset = month_entries(month, year)
    subset.sum(:hours) + (subset.sum(:minutes) / 60.0)
  end

  def self.iron_find(date = Date.current)
    where("created_at > ?", date).order(:name).limit(10)
  end

  def self.clean_old(date = 1.week.ago)
    where("created_at < ?", date).destroy_all
  end

  def self.last_created(limit)
    order(created_at: :desc).limit(limit)
  end

  def month_entries(month = Date.current.month, year = Date.current.year)
    dt = Date.new(year, month, 1)
    entries.where("date <= ?", dt.end_of_month).
      where("date >= ?", dt)
  end
end
