class SessionsController < ApplicationController

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:notice] = "WELCOME IN CAVE"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = "PROBLEM LOG IN. TRY NEW TIME"
      redirect_to log_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "YOU LEAVE CAVE. BYE."
    redirect_to root_path
  end

end
