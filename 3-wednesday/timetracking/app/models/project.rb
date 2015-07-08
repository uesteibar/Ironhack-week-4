
class Project < ActiveRecord::Base
  has_many :entries

  validates_presence_of :name
  validates_uniqueness_of :name

  def total_hours_in_month(month = Date.current.month, year = Date.current.year)
    return if month.nil? || year.nil?

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

  private

  def month_entries(month, year)
    entries.where("date <= ?", Date.new(year, month, -1)).
      where("date >= ?", Date.new(year, month, 1))
  end
end
