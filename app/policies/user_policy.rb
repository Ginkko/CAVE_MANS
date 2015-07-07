class UserPolicy
  attr_reader :current_user, :target_user

  def initialize(current_user, target_user)
    @current_user = current_user
    @target_user = target_user
  end

  def edit?
    if @current_user
      @current_user.is_admin || @current_user == @target_user
    end
  end

  def destroy?
    @current_user.is_admin || @current_user == @target_user
  end

  def index?
    if @current_user
      @current_user.is_admin
    end
  end

  def show?
   @current_user
  end

end
