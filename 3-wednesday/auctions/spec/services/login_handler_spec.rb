require "rails_helper"

describe LoginHandler do
  before(:each) do
    @email = "jonhdoe@example.com"
    @password = "1234"
    @user = User.create(name: "Jonh Doe", email: @email, password: @password)
    @login_handler = LoginHandler.new
  end

  describe '#login' do
    it 'should return the user when email and password match' do
      expect(@login_handler.login(@email, @password).id).to eq @user.id
    end

    it 'should return nil when email and password do not match' do
      expect(@login_handler.login(@email, "1111")).to be_falsy
      expect(@login_handler.login("whatever@whatever.com", @password)).to be_falsy
    end
  end
end
