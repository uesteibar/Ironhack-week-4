class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validate :correct_amount
  validate :is_before_deadline
  validate :is_different_user

  private

  def correct_amount
    product = Product.find(product_id)
    last_bid = 0
    if product.bids.any?
      last_bid = product.bids.last.amount
    end
    unless amount > last_bid && amount > product.minimum_bid
      errors.add(:amount, "amount should be higher than the last bid")
    end
  end

  def is_before_deadline
    product = Product.find(product_id)
    if product.deadline < Date.current
      errors.add(:deadline, "deadline is passed!")
    end
  end

  def is_different_user
    product = Product.find(product_id)
    if user_id == product.user.id
      errors.add(:user_id, "the bidder cannot be the owner!")
    end
  end
end
