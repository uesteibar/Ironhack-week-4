class CommentsController < ApplicationController
  def index
    @comments = Comment.where("movie_id = ?", params[:movie_id])
  end
end
