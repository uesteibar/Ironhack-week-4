require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before(:each) do
    @movie = Movie.create(title: 'matrix', synopsis: 'matrix', year: 2000)
  end

  describe 'POST #create' do
    it 'creates a comment' do
      expect do
        post :create, comment: { username: 'Willi', content: 'this sucked' }, movie_id: @movie.id
      end.to change(Comment, :count).by(1)
    end
  end
end
