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
    before(:each) do
      Movie.create(title: "matrix", synopsis: "matrix", year: 2000)
    end

    it "should respond successfully with an HTTP 200 status code" do
      get :index, term: "matrix"
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it "should render the index template" do
      get :index, term: "matrix"
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    before(:each) do
      @movie = Movie.create(title: "matrix", synopsis: "matrix", year: 2000)
    end

    it "should respond successfully with an HTTP 200 status code" do
      get :show, id: @movie.id
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it "should render the show template" do
      get :show, id: @movie.id
      expect(response).to render_template("show")
    end
  end

  describe 'POST #create' do
    it 'creates a movie' do
      expect do
        post :create, movie: { title: 'Matrix', synopsis: 'awesome film', year: 2000 }
      end.to change(Movie, :count).by(1)
    end
  end
end
