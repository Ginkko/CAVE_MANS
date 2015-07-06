class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "WELCOME PEASANT"
      redirect_to root_path
    else
      flash[:notice] = "YOU DONE MESSED UP. OR MAYBE WE DID. YOU GO BACK NOW"
      redirect_to :back
    end
  end

  def index
    @users = User.all
  end

  private def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
