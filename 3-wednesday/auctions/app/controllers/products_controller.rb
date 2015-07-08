class ProductsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @products = Product.where(user_id: params[:user_id])
  end
end
