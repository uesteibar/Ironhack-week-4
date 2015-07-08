require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @user = User.create(name: "name", email: "email@example.com")
  end

  describe 'product - creation' do
    it 'should create a product when provided correct values' do
      product = @user.products.create(
        title: "Awesome thing",
        description: "Super super awesome!",
        deadline: 1.day.from_now
      )
      expect(product.id).not_to be_falsy
    end

    it 'should fail when the deadline is before the current day' do
      expect do
        @user.products.create!(
          title: "Awesome thing",
          description: "Super super awesome!",
          deadline: 1.day.ago
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
