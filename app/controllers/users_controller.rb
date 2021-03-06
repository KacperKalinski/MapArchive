class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/' #redirect to home page
    else
      redirect_to '/signup' #or new_user_path - depends on routes
    end
  end

  private
  def user_params
    params.require(:user).permit(:login,:email,:password)
  end
end
