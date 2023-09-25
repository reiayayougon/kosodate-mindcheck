class QuestionsController < ApplicationController
  before_action :find_question, only: %i[edit update destroy]
  before_action :initialize_session

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to new_question_path
      flash[:success] = "質問を作成しました"
    else
      flash.now[:error] = "質問作成に失敗しました"
      render new_question_path
      
    end
  end


  def show
    question_history = session[:question_history] || []
    session.delete(:answered_count)
    session.delete(:question_history)
    puts "回答数: #{session[:answered_count]}" 
    puts "質問履歴: #{question_history.inspect}"
    @user = current_user
        current_user.calculate_status
        @user_answer_counts = @user.answers.where(answer_select: "yes")
                                        .joins(question: :category)
                                        .group("categories.name")
                                        .count
  end


  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to new_question_path, success: '質問を変更しました'
    else
      flash.now[:error] = "質問作成に失敗しました"
      render new_question_path
    end
  end

  def destroy
  end


  def random
    
    question_history = session[:question_history] || []
    @question = select_random_question(question_history)
    @answer = Answer.new
    session[:question_history] << @question.id

    if session[:question_history].size > 10
      session[:question_history].shift(session[:question_history].size - 10)
    end
    session[:question_history] ||= [] #セッション履歴が存在しない場合に初期化

    question_history = session[:question_history]
    puts "Session ID: #{session.id}"
    puts "質問履歴: #{question_history.inspect}"
    
  end

  private

  def select_random_question(question_history)
    #すべての質問から、履歴に含まれていない質問をランダムに選択
    available_questions = Question.where.not(id: question_history)
    if available_questions.empty?
      #履歴に含まれている質問がすべて表示された場合、履歴をクリア
      question_history.clear
      available_questions = Question.all
    end
    selected_question = available_questions.order('RANDOM()').first
    #選択した質問がnilでないか確認
    if selected_question
      return selected_question
    else
    #使用可能な質問がない場合は、全質問の中からランダムに選択
      return Question.order('RANDOM()').first
    end
  end
  
  def initialize_session
    session[:question_history] ||= []
  end
  

  def find_question
    @question = current_user.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content, :user_id, :category_id)
  end

end

