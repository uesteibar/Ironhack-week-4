class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to action: "show", id: @user.id
    else
      render :new
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
