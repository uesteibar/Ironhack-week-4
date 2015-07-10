class ConcertsController < ApplicationController
  def index
    @concerts = Concert.all.order(:date)
  end

  def show
    @concert = Concert.find(params[:id])
  end
end
