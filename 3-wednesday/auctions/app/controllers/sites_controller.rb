class SitesController < ApplicationController
  def home
    if session[:user_id] && User.find(session[:user_id])
      redirect_to "/users"
      return
    end
    @user = User.new
  end

  def login
    user = LoginHandler.new.login(login_params[:email], login_params[:password])
    if user
      session[:user_id] = user.id
      redirect_to "/users"
      return
    end
    redirect_to "/"
  end

  def logout
    session[:user_id] = nil
    redirect_to "/"
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
