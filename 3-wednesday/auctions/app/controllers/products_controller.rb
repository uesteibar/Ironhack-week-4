class ProductsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @product = @user.products.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @product = @user.products.new(product_params)
    if @product.valid?
      @product.save
      redirect_to action: "index", user_id: @user.id
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :desctiption, :deadline)
  end
end
