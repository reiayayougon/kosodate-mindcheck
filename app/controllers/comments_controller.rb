class CommentsController < ApplicationController
    include ApplicationHelper
    before_action :find_commentable, only: %i[edit create]
    before_action :find_comment, only: %i[edit update destroy]
    

    def new
        @comment = Comment.new
    end

    def create
        @comment = @commentable.comments.build(comment_params)
        if @comment.save
            redirect_to @comment.post
        else
            redirect_to @comment.post
        end
    end
        
    def edit
    
    end

    def update
        if @comment.update(comment_params)
            redirect_to @comment.post
        else 
            render :edit
        end
    end

    

    def destroy
        @comment.destroy!
        flash.now[:success] = 'コメントを削除しました'    
    end

    private

    def comment_params
        params.require(:comment).permit(:content).merge(user_id: current_user.id)
    end

    def find_commentable
        params.each do |name, value|
            @commentable = ::Regexp.last_match(1).classify.constantize.find(value) if name =~ /(.+)_id$/
        end
        nil
    end

    def find_comment
        @comment = Comment.includes(:post).find(params[:id])
    end
    
end
