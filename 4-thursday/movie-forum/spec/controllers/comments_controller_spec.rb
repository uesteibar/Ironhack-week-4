require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "GET #index" do
    before(:each) do
      @movie = Movie.create(title: "matrix", synopsis: "matrix", year: 2000)
    end
    
    it "should respond successfully with an HTTP 200 status code" do
      get :index, movie_id: @movie.id
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it "should render the index template" do
      get :index, movie_id: @movie.id
      expect(response).to render_template("index")
    end
  end
end
