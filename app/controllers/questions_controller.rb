class QuestionsController < ApplicationController
  before_action :find_question, only: %i[edit update destroy]
  before_action :initialize_session
  before_action :set_user, only: %i[start]

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to new_question_path, success: t('defaults.message.created', item: Question.model_name.human)
    else
      flash.now[:error] = t('defaults.message.not_created', item: Question.model_name.human)
      render new_question_path
    end
  end

  def show
    post_history = session[:post_history] || []
    session.delete(:answered_count)
    session.delete(:post_history)
    puts "回答数: #{session[:answered_count]}" 
    puts "質問履歴: #{post_history.inspect}"
    @user = current_user
    current_user.calculate_status
    @user_with_most_yes_answers = Post.user_with_most_yes_answers.first

  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to new_question_path, success: t('defaults.message.updated', item: Question.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Question.model_name.human)
      render new_question_path
    end
  end

  def destroy; end

  def start
    return unless logged_in? && @user.status.zero? 
    redirect_to albums_path, success: t('defaults.message.status_full')
  end  

  def random
    post_history = session[:post_history] || []
    @post = select_random_post(post_history)
    @answer = Answer.new
    current_user.calculate_status
    session[:post_history] << @post.id

    if session[:post_history].size > 10
      session[:post_history].shift(session[:post_history].size - 10)
    end
    session[:post_history] ||= [] # セッション履歴が存在しない場合に初期化

    post_history = session[:post_history]
    @post_number = post_history.size
    puts "Session ID: #{session.id}"
    
  end

  private

  def select_random_post(post_history)
    # 履歴に含まれていない質問をランダムに選択
    available_posts = Post.where.not(id: post_history)
    if available_posts.empty?
      # 履歴に含まれている質問がすべて表示された場合、履歴をクリア
      post_history.clear
      available_posts = Post.all # すべての質問を再び利用可能な質問として設定
    end
    selected_post = available_posts.order('RANDOM()').first
    # 選択した質問がnilでないか確認.使用可能な質問がない場合は、全質問の中からランダムに選択
    selected_post || Post.order('RANDOM()').first
  end
  
  def initialize_session
    session[:post_history] ||= []
  end  

  def find_question
    @post = current_user.posts.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content, :user_id, :category_id)
  end

  def set_user
    return unless logged_in?
    @user = User.find(current_user.id)
  end
end
