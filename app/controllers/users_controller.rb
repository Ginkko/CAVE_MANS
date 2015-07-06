class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "WELCOME PEASANT"
      if current_user && current_user.is_admin
        redirect_to users_path
      else
        redirect_to log_in_path
      end
    else
      # flash[:notice] = "YOU DONE MESSED UP. OR MAYBE WE DID. YOU GO BACK NOW"
      render :new
    end
  end

  def index
    @users = User.all
    authorize current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "#{@user.name} BYE BYE"
    if current_user.is_admin
      redirect_to users_path
    else
      redirect_to root_path
    end
  end

  private def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
