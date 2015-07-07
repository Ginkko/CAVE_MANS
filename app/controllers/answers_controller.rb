class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    if @answer.save
      flash[:notice] = "THANK KNOWING. HOPE BRAIN NO HURT MUCH NOW."
        redirect_to question_path(@answer.question)
    else
      render :new
    end
  end

  def update
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    authorize @answer
    if @answer.update(answer_params)
      flash[:alert] = "WHY YOU CHANGE KNOW. HURT DIFFERENT"
      redirect_to question_path(@answer.question)
    else
      render :edit
    end
  end

  def edit
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    authorize @answer
  end

  def destroy
    @answer = Answer.find(params[:id])
    authorize @answer
    @answer.destroy
    flash[:notice] = "GONE. BRAIN STILL HURT"
    redirect_to question_path(@answer.question)
  end

  private def answer_params
    params.require(:answer).permit(:content, :user_id, :question_id)
  end

end
