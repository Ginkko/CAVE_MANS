class AnswerPolicy
  attr_reader :user, :answer

  def initialize(user, answer)
    @user = user
    @answer = answer
  end

  def edit?
    @user.is_admin || @user == @answer.user
  end

  def update?
    @user.is_admin || @user == @answer.user
  end


  def destroy?
    @user.is_admin || @user == @answer.user
  end

end
