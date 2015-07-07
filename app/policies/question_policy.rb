class QuestionPolicy
  attr_reader :user, :question

  def initialize(user, question)
    @user = user
    @question = question
  end

  def edit?
    @user.is_admin || @user == @question.user
  end

  def update?
    @user.is_admin || @user == @question.user
  end

  def destroy?
    @user.is_admin || @user == @question.user
  end

  def show?
    @user
  end

  def index?
    @current_user
  end


end
