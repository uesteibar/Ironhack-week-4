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
    if (url = Url.find_by(url: UrlCompleter.new(url_params[:url]).complete)).nil?
      url = Url.new(shortcut: StringShortcutGenerator.new(6).generate, url: url_params[:url])
      if url.valid?
        url.save
        redirect_to url_path(url), notice: "Url was successfully created."
      else
        redirect_to action: "new"
      end
    else
      redirect_to action: "show", id: url.id
    end
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
