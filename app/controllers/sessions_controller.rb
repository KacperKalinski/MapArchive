class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_login(params[:session][:login])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to signin_path, alert: 'Incorrect login/password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
