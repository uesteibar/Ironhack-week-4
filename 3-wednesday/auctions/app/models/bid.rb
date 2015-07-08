class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validate :correct_amount

  private

  def correct_amount
    unless amount > 0
      errors.add(:amount, "amount should be higher than 0")
    end
  end
end
