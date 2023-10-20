class CategoriesController < ApplicationController
  
  def new
    @category = Category.new
  end

  def category
    @category = Category.find(params[:id])
    @posts = @category.posts
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      @categories = Category.all
      render 'index'
    end
  end

  def index
    @categories = Category.all
    return unless current_user.status == 0

    current_user.reset_status
    current_user.update(status: 100) 
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  def edit; end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
