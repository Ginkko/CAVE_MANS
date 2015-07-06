class UserPolicy
  attr_reader :user, :user1

  def initialize(user, user1)
    @user = user
  end

  def edit?
    user.is_admin or current_user == user
  end

  def index?
    user.is_admin
  end

end
