class ConcertsController < ApplicationController
  def index
    @concerts_today = Concert.today
    @concerts_this_month = Concert.this_month
  end

  def show
    @concert = Concert.find(params[:id])
    @comment = @concert.comments.new
  end

  def search
  end

  def budget
    @concerts = Concert.budget(params[:budget])
  end

  def most_commented
    @concerts = Concert.most_commented
  end

  def new
    @concert = Concert.new
  end

  def create
    @concert = Concert.new(concert_params)
    if @concert.valid?
      @concert.save
      redirect_to action: "show", id: @concert.id
      flash[:success] = "#{@concert.band}'s concert was successfully created."
      return
    end
    render :new
  end

  private

  def concert_params
    params.require(:concert).permit(:band, :venue, :city, :date, :price, :description, :poster)
  end
end
