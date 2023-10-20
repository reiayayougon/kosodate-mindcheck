class LikesController < ApplicationController
    before_action :set_post, only: [:create, :destroy]

    def create
        current_user.like(@post)
        respond_to(&:turbo_stream)
    end    

    def destroy
        current_user.unlike(@post)
        respond_to(&:turbo_stream)
    end
    
  private

    def set_post
        @post = Post.find(params[:post_id])
    end
    
end
