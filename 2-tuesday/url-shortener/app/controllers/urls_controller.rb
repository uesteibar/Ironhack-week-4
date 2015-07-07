class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def show
    @url = Url.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render_404(params)
  end

  def new
    @url = Url.new
  end

  def create
    url = Url.find_or_initialize_by(url: UrlCompleter.new(url_params[:url]).complete)
    if url.valid?
      url.save
      redirect_to url_path(url), notice: "Url was successfully created."
    else
      redirect_to action: "new"
    end

  end

  def most_visited_pages
    @urls = Url.limit(10).order(times_visited: :desc)
  end

  private

  def render_404(params)
    Rails.logger.warn("Tried to access #{params} which did not exist")
    render 'layouts/404'
  end

  def url_params
    params.require(:url).permit(:url)
  end
end
