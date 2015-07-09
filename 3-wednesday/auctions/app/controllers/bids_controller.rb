class BidsController < ApplicationController
  def create
    user = User.find_by(email: user_params[:email])
    if user.id.present?
      user.bids.create(product_id: product_params[:product_id], amount: bid_params[:amount])
    end
    redirect_to user_product_path(id: product_params[:product_id])
  end

  private

  def bid_params
    params.require(:bid).permit(:product_id, :amount)
  end

  def product_params
    params.permit(:product_id)
  end

  def user_params
    params.require(:user).permit(:email)
  end
end
