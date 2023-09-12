class CommentsController < ApplicationController
    before_action :find_commentable, only: %i[create edit]
    before_action :find_comment, only: %i[edit update destroy]

    def new
        @comment = Comment.new
    end

    def create
        @comment = @commentable.comments.build(comment_params)
        respond_to do |format|
            if @comment.save
                #複数の箇所を同時に更新するためにturbo_stream
                format.turbo_stream { flash.now[:success] = "コメント作成しました" }
                format.html { redirect_to @comment.post, flash: { success: 'コメントしました' } }
            else
                format.turbo_stream do
                    flash.now[:danger] = "コメント作成失敗しました"
                    render turbo_stream: [
                        turbo_stream.replace("flash_messages", partial: "shared/flash_messages"),
                    ]
                end
                format.html { redirect_to @comment.post, 
                                flash: { danger: 'コメント作成に失敗しました' } }
            end
        end
    end
        
    def edit;end

    def update
        respond_to do |format|
            if @comment.update(comment_params)
                format.turbo_stream  { flash.now[:success] = "コメントを更新しました" }
                format.html { redirect_to @comment.post, flash: { success: 'コメントを更新しました' } }
            else
                format.turbo_stream do
                    flash.now[:warning] = 'コメントを更新に失敗しました'
                    render turbo_stream: [
                        turbo_stream.replace("flash_messages", partial: "shared/flash_messages"),
                    ]
                end
                format.html { redirect_to @comment.post, 
                            flash: { danger: 'コメントを更新しました' } }
            end
        end
    end

    def destroy
        respond_to do |format|
            if @comment.destroy
                format.turbo_stream { flash.now[:success] = 'コメントを削除しました' }
                format.html { redirect_to @comment.post,
                                flash: { success: 'コメント削除しました' } }
            else
                format.turbo_stream do
                    flash.now[:danger] = 'コメントの削除に失敗しました'
                    render turbo_stream: [
                        turbo_stream.replace("flash_messages", partial: "shared/flash_messages"),
                    ]
                end
                format.html { redirect_to @comment.post, flash: { danger: 'コメントの削除に失敗しました' } }
            end
        end
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

    def find_comment
        @comment = current_user.comments.find(params[:id])
    end

end
