require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @movie = Movie.create(
    title: "matrix",
    synopsis: "matrix",
    year: 2000
    )

    @user = User.create(
    username: "uesteibar",
    password: "1234"
    )
  end

  it 'should create a comment when all parameters are correct' do
    expect(@movie.comments.create(
    user_id: @user.id,
    content: "I love it!"
    ).id).not_to be_falsy
  end

  it 'should NOT create a comment when user_id is nil' do
    expect do
      @movie.comments.create!(
      user_id: nil,
      content: "I love it!"
      )
    end.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should NOT create a comment when comment is nil' do
    expect do
      @movie.comments.create!(
      user_id: @user.id,
      content: nil
      )
    end.to raise_error(ActiveRecord::RecordInvalid)
  end

end
