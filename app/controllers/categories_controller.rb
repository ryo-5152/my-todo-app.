class CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.all
    @todo = @category.todos.build
  end
  
  def show
  
    
    @category = Category.find(params[:id])
    @todo = @category.todos.build
    @todos = @category.todos.all
    
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
    @todo = @category.todos.build
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private
    def category_params
      params.require(:category).permit(:title)
    end
end

