class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from Pundit::NotDefinedError, with: :not_logged_in
  private

  def user_not_authorized
    flash[:alert] = "YOU NO DO. BAD. YOU GET STRONGER MAYBE DO LATER"
    redirect_to(request.referrer || root_path)
  end

  def not_logged_in
    flash[:alert] = "YOU NO GO HERE. CAVE ENTER MAYBE GO"
    redirect_to log_in_path
  end

  helper_method :current_user

end
