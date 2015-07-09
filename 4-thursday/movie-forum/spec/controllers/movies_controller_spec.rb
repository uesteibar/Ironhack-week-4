require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET #search" do
    it "should respond successfully with an HTTP 200 status code" do
      get :search
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it "should render the search template" do
      get :search
      expect(response).to render_template("search")
    end
  end

  describe "GET #index" do
    it "should respond successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it "should render the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
