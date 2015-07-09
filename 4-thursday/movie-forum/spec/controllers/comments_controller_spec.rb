require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before(:each) do
    @movie = Movie.create(title: 'matrix', synopsis: 'matrix', year: 2000)
    @user = User.create(
    username: "uesteibar",
    password: "1234"
    )
  end
end
