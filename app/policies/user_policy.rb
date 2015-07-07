class UserPolicy
  attr_reader :user, :user1

  def initialize(user, user1)
    @user = user
  end

  def edit?
    binding.pry
    user.is_admin || user == @curent_user
  end

  def index?
    user.is_admin
  end

end
