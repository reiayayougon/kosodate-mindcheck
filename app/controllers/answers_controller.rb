class AnswersController < ApplicationController
  
  def create
    @answered_count = session[:answered_count] || 0
    @post = Post.find(params[:post_id])
    @user = current_user
    @answer = @post.answers.build(answer_params)
    @answer.user = @user
    @answer.save
    puts "回答数: #{session[:answered_count]}" 
    session[:answered_count] ||= 0
    session[:answered_count] += 1
    
    if current_user.status.zero? || session[:answered_count] >= 10
      redirect_to question_path(@answer)
    else
      redirect_to random_questions_path
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:answer_select)
  end
end
