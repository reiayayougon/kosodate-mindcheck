class QuestionsController < ApplicationController
  before_action :initialize_session
  before_action :set_user, only: %i[start]

  def show
    post_history = session[:post_history] || []
    session.delete(:answered_count)
    session.delete(:post_history)
    puts "回答数: #{session[:answered_count]}" 
    puts "質問履歴: #{post_history.inspect}"
    @user = current_user
    current_user.calculate_status
    @most_user = User.most_user.name
    @user_info = User.find_by(name: @most_user)
  end

  def edit; end


  def start
    return unless logged_in? 
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

  def set_user
    return unless logged_in?
    @user = User.find(current_user.id)
  end
end
