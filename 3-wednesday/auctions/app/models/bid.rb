class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validate :correct_amount

  private

  def correct_amount
    product = Product.find(product_id)
    last_bid = 0
    if product.bids.any?
      last_bid = product.bids.last.amount
    end
    unless amount > last_bid
      errors.add(:amount, "amount should be higher than the last bid")
    end
  end
end
