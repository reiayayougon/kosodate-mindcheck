class CommentsController < ApplicationController
    before_action :find_commentable, only: %i[edit create]
    before_action :find_comment, only: %i[edit update destroy]
    

    def new
        @comment = Comment.new
    end

    def create
        @comment = @commentable.comments.build(comment_params)
        if @comment.save
            flash.now[:success] = "コメント作成しました"
        else
            flash.now[:danger] = "コメントを作成できませんでした"
            redirect_to request.referer
            
        end
        
    end
        
    def edit
    
    end

    def update
        if @comment.update(comment_params)
            flash[:success] = 'コメントを更新しました'
            redirect_to @comment.post
        else 
            flash.now['danger'] = 'コメントを更新できませんでした'
            render :edit
        end
    end

    def destroy
        @comment.destroy!
        flash.now.notice = 'コメントを削除しました'    
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
