require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "GET #index" do
    before(:each) do
      @movie = Movie.create(title: "matrix", synopsis: "matrix", year: 2000)
    end

    
  end
end
