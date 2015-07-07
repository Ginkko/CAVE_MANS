class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      binding.pry
      flash[:notice] = "BRAIN HURT NOW. WHY DO THIS"
        redirect_to question_path(@question)
    else
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])
    authorize @question
    if @question.update(question_params)
      flash[:alert] = "BRAIN HURT DIFFERENT"
        redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
    authorize @question
  end

  def destroy
    @question = Question.find(params[:id])
    authorize @question
    @question.destroy
    flash[:notice] = "#{@question.name} GONE. BRAIN HURT NO AS MUCH"
    redirect_to questions_path
  end

  private def question_params
    params.require(:question).permit(:name, :body, :user_id)
  end

end
