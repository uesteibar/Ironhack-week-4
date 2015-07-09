require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @name = 'John Doe'

    @email = 'email@example.com'
  end

  describe 'user - creation' do
    it 'should create a user when data is correct' do
      user = User.create(name: @name, password: "1234", email: @email)
      expect(user.id).not_to be_falsy
    end

    it 'should fail when user email is already used' do
      User.create(name: @name, password: "1234", email: @email)
      expect do
        User.create!(name: @name, password: "1234", email: @email)
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
