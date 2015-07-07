class UserPolicy
  attr_reader :current_user, :target_user

  def initialize(current_user, target_user)
    @current_user = current_user
    @target_user = target_user
  end

  def edit?
    @current_user.is_admin || @current_user == @target_user
  end

  def destroy?
    @current_user.is_admin || @current_user == @target_user
  end

  def index?
    @current_user.is_admin
  end

end
