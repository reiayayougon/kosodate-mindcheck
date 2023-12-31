class PostsController < ApplicationController
  before_action :set_q, only: %i[index search]
  before_action :find_post, only: %i[edit update destroy]

  def index
    @q = Post.ransack(params[:q])
    @selected_category = Category.find(params[:q][:category_id_eq]) if params[:q] && params[:q][:category_id_eq]
    @posts = @q.result(distinct: true).includes(:user, :category).order(created_at: :desc).page(params[:page]).per(5)
    
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      category_id = params[:post][:category_id]
      category = Category.find(category_id)
      @post.category = category
      redirect_to posts_path, success: t('defaults.message.created', item: Post.model_name.human)
    else
      flash.now[:error] = t('defaults.message.not_created', item: Post.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to posts_path, success: t('defaults.message.updated', item: Post.model_name.human)
    else
      flash.now[:error] = t('defaults.message.not_updated', item: Post.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    flash.now[:success] = t('defaults.message.deleted', item: Post.model_name.human)
  end
  
  def likes
    @like_post = current_user.liked_posts.includes(:user).order(created_at: :desc)
  end

  def search
    @q = Post.ransack(params[:q])
    @results = @q.result
    if params[:q] && params[:q][:category_id_eq].present?
      @selected_category = Category.find(params[:q][:category_id_eq])
    end
    @posts = @q.result(distinct: true).includes(:user, :category).order(created_at: :desc).page(params[:page]).per(6)
  end

  def category
    category_id = params[:category_id]
    @category = Category.find(category_id)
    @posts = @category.posts.includes(:user).order(created_at: :desc).page(params[:page]).per(8)
  end

  def channel
    @room = Post.find(params[:id])
    @messages = @room.messages
  end

  private

  def post_params
    params.require(:post).permit(:content, :category_id)
  end

  def find_post
    @post = current_user.posts.find(params[:id])
  end

  def set_q
    @set_q = Post.ransack(params[:q])
    @set_q_post = @set_q.result(distinct: true).order(created_at: :desc).page(params[:page])
  end
end
