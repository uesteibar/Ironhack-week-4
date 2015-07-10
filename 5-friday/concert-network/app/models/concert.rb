class Concert < ActiveRecord::Base
  has_many :comments

  has_attached_file :poster, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :poster, :content_type => /\Aimage\/.*\Z/

  validates_presence_of :band, :venue, :city, :price, :date, :description

  def self.today
    where(date: Date.today)
  end

  def self.this_month
    upcoming.where("date <= ?", Date.today.end_of_month)
  end

  def self.budget(price_limit)
    where("price <= ?", price_limit).order(:price)
  end

  def self.most_commented(limit = 10)
    upcoming.order("comments_count DESC").limit(limit)
  end

  private

  def self.upcoming
    where("date > ?", Date.today)
  end
end
