class BidsController < ApplicationController
  def create
    user = User.find_by(email: bid_params[:email])
    user.bids.create(product_id: bid_params[:product_id], amount: bid_params[:amount])
  end

  private

  def bid_params
    params.require(:bid).permit(:product_id, :amount, :email)
  end
end
