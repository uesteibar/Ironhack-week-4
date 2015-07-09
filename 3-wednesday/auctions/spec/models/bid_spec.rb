require 'rails_helper'

RSpec.describe Bid, type: :model do
  before(:each) do
    owner = User.create(name: "owner", email: "owner@example.com")
    @product = owner.products.create(
      title: "Awesome thing",
      description: "Super super awesome!",
      deadline: 1.day.from_now
    )
    @bidder = User.create(name: "bidder", email: "bidder@example.com")
  end

  describe 'bid - creation' do
    it 'should create a bid when all parametres are correct' do
      bid = @bidder.bids.create(product_id: @product.id, amount: 10)
      expect(bid.id).not_to be_falsy
    end

    it 'should NOT create a bid when amount is 0' do
      expect do
        @bidder.bids.create!(product_id: @product.id, amount: 0)
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should NOT create a bid when amount is less than 0' do
      expect do
        @bidder.bids.create!(product_id: @product.id, amount: -10)
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should NOT create a bid when deadline is older than today' do
      @product.update_attribute(:deadline, 1.day.ago)
      @product.save
      expect do
        @bidder.bids.create!(product_id: @product.reload.id, amount: 10)
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
