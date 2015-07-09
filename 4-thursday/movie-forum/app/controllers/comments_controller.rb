class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.valid?
      comment.save
    end
    redirect_to "/movies/#{comment_params[:movie_id]}"
  end

  private

  def comment_params
    filetered_params = params.require(:comment).permit(:username, :content)
    filetered_params[:movie_id] = params[:movie_id]
    filetered_params
  end
end
