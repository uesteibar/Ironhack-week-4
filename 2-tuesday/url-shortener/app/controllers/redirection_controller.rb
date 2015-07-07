
class RedirectionController < ApplicationController
  def redirect
    redirect_to UrlRedirecter.new(Url.find_by(shortcut: params[:shortcut])).url
  end
end
