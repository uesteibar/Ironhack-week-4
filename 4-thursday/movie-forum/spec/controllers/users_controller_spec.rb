require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "should respond successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it "should render the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET #login" do
    it "should respond successfully with an HTTP 200 status code" do
      get :login
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it "should render the login template" do
      get :login
      expect(response).to render_template("login")
    end
  end

  describe 'POST #create' do
    it 'creates a user' do
      expect do
        post :create, user: { username: 'uesteibar', password: 'password' }
      end.to change(User, :count).by(1)
    end
  end
end
