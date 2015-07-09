class UsersController < ApplicationController
  def login
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to "/movies/search"
      return
    end
    render :new
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
