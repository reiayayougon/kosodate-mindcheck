class CommentsController < ApplicationController
    before_action :find_commentable, only: %i[create ]
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
            redirect_to @comment.post, notice: 'コメントを更新しました'
            # redirect_to posts_show_path, success: 'コメントを更新しました'
        else 
            # flash.now['danger'] = 'コメントを更新できませんでした'
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @comment.destroy
        flash.now.notice = 'コメントを削除しました'
            #     format.turbo_stream { flash.now[:success] = 'コメントを削除しました' }
            #     format.html { redirect_to @comment.post,
            #                     flash: { success: 'コメント削除しました' } }
            # else
            #     format.turbo_stream do
            #         flash.now[:danger] = 'コメントの削除に失敗しました'
            #         render turbo_stream: [
            #             turbo_stream.replace("flash_message", partial: "shared/flash_message"),
            #         ]
            #     end
            #     format.html { redirect_to @comment.post, flash: { danger: 'コメントの削除に失敗しました' } }
    end
    private

    def comment_params
        params.require(:comment).permit(:content).merge(user_id: current_user.id)
    end

    # def comment_update_params
    #     params.require(:comment).permit(:content)
    # end

    def find_commentable
        params.each do |name, value|
            @commentable = ::Regexp.last_match(1).classify.constantize.find(value) if name =~ /(.+)_id$/
        end
        nil
    end

    # def find_comment
    #     @comment = current_user.comments.includes(:post).find(params[:id])
    # end
    def find_comment
        @comment = Comment.includes(:post).find(params[:id])
    end
    
end
