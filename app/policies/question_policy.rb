class QuestionPolicy
  attr_reader :current_user, :question

  def initialize(current_user, question)
    @current_user = current_user
    @question = question
  end

  def edit?
    @current_user.is_admin || @current_user == @question.user
  end

  def destroy?
    @current_user.is_admin || @current_user == @question.user
  end

  def index?
    binding.pry
    if @current_user
  end

end
