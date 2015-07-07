class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def show
    @url = Url.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render_404(params)
  end

  private

  def render_404(params)
    Rails.logger.warn("Tried to access #{params} which did not exist")
    render 'layouts/404'
  end
end
