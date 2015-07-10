class ConcertsController < ApplicationController
  def index
    concerts = Concert.all.order(:date)
    @concerts_today = concerts.where(date: Date.today)
    @concerts_this_month = concerts.where("date > ?", Date.today).where("date <= ?", Date.today.end_of_month)
  end

  def show
    @concert = Concert.find(params[:id])
    @comment = @concert.comments.new
  end

  def new
    @concert = Concert.new
  end

  def create
    @concert = Concert.new(concert_params)
    if @concert.valid?
      @concert.save
      redirect_to action: "show", id: @concert.id
      return
    end
    render :new
  end

  private

  def concert_params
    params.require(:concert).permit(:band, :venue, :city, :date, :price, :description)
  end
end
