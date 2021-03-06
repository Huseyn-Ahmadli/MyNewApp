class QuestionsController < ApplicationController
  before_action :find_question!, only: %i[show delete edit update]
  def index
    @questions = Question.all.order(created_at: :desc).page params[:page]
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    flash[:success] = 'Question created'
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update question_params
      flash[:success] = 'Question edited successfully'
      redirect_to questions_path
    else
      render :edit
    end
  end

  def show
    @answer = @question.answers.build
    @answers = @question.answers.order(created_at: :desc).page(params[:page]).per(5)
  end

  def destroy
    @question.destroy
    flash[:success] = 'Question deleted'
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def find_question!
    @question = Question.find params[:id]
  end
end