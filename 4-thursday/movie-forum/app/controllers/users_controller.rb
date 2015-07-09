class UsersController < ApplicationController
  def login
    redirect_if_session
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

  def authenticate
    @user = User.find_by(user_params)
    if @user.id.present?
      session[:user_id]
      redirect_to "/movies/search"
      return
    end
    render :login
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def redirect_if_session
    if session_user_id
      redirect_to "/movies/search"
      return
    end
  end

  def session_user_id
    session[:user_id]
  end
end
