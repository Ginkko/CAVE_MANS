class QuestionPolicy
  attr_reader :user, :question

  def initialize(user, question)
    @user = user
    @question = question
  end

  def edit?
    @user.is_admin || @user == @question.user
  end

  def destroy?
    @user.is_admin || @user == @question.user
  end

  def index?
    @user
  end

end
