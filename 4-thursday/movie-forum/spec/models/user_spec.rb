require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user - creation' do
    before(:each) do
      @username = "uesteibar"
      @password = "1234"
    end

    it 'should create the user when username and password are provided' do
      expect(User.create(
      username: @username,
      password: @password
      ).id).not_to be_falsy
    end

    it 'should NOT create the user when username is nil' do
      expect do
        User.create!(
        username: nil,
        password: @password
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should NOT create the user when password is nil' do
      expect do
        User.create!(
        username: @username,
        password: nil
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
