
class RedirectionController < ApplicationController
  def redirect
    url = Url.find_by(shortcut: params[:shortcut])
    if url.present?
      redirect_to UrlRedirecter.new(url).redirect
    else
      render "layouts/404"
    end
  end
end
