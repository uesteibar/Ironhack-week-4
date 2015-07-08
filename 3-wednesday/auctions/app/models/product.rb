class Product < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user_id
  validate :correct_deadline

  private

  def correct_deadline
    unless deadline > DateTime.current
      errors.add(:deadline, "deadline can't be before the current moment")
    end
  end
end
