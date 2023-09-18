class QuestionsController < ApplicationController
  before_action :find_question, only: %i[edit update destroy]

  def index
    questions = Question.order('RANDOM()').limit(10) 
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to new_question_path
      flash[:success] = "質問を作成しました"
    else
      flash.now['danger'] = "質問作成に失敗しました"
      render new_question_path
      
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to new_question_path, success: '質問を変更しました'
    else
      flash.now['danger'] = "質問作成に失敗しました"
      render new_question_path
    end
  end

  def destroy
  end

  private

  def find_question
    @question = cuurent_user.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content, :user_id, :category_id)
  end
end

