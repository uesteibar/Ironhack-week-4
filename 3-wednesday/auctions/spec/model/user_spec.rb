require "rails_helper"

describe User do
  before(:each) do
    @name = "John Doe"
    @email = "email@example.com"
  end

  describe 'user - creation' do
    it 'should create a user when data is correct' do
      user = User.create(name: @name, email: @email)
      expect(user.id).not_to be_falsy
    end

    it 'should fail when user email is already used' do
      User.create(name: @name, email: @email)
      expect {
        User.create!(name: @name, email: @email)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
