class AnswersController < ApplicationController
  before_action :find_question!


  def create
    @answer = @question.answers.build answer_params
    if @answer.save
      flash[:success] = 'Answer created!'
      redirect_to question_path(@question)
    else
      @answers = Answer.order created_at: :desc
      render 'questions/show'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def find_question!
    @question = Question.find params[:question_id]
  end
end
