class CommentsController < ApplicationController
    before_action :find_commentable, only: %i[edit create]
    before_action :find_comment, only: %i[edit update destroy]
    

    def new
        @comment = Comment.new
    end

    def create
        @comment = @commentable.comments.build(comment_params)
        respond_to do |format|
            if @comment.save
                format.turbo_stream { flash.now[:success] = 'コメントを作成しました' }
                format.html { redirect_to @comment.post,
                                flash: { success: 'コメントを作成しました' } }
            else
                format.turbo_stream do
                flash.now[:danger] = 'コメントを作成できませんでした'
                render render_flash_messages
                end
                format.html { redirect_to @comment.commentable,
                            flash: { danger:  'コメントを作成できませんでした' } }
            end
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
