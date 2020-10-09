class CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.all
    @todo =@category.todos.build
    @todos = @category.todos.all
  end
  
  def show
    
    @category = Category.find(params[:id])
    
    @todo =@category.todos.find_by(params[:id])
    @todos = @category.todos.all
    
  end

  def new
    @category = Category.new
    @category.todos.new
  end

  def create
    @category = Category.create(category_params)

    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])


  end

  def update
    @category = Category.find(params[:id])
    if @category.update(update_category_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private
    def category_params
      params.require(:category).permit(:title, todos_attributes: [:id, :content])
    end
    
    def update_category_params
      params.require(:category).permit(:title, todos_attributes: [:id, :content,:_destroy])
    end
end

