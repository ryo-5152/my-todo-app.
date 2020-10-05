class TodosController < ApplicationController
    



    def create
        @category = Category.find_by(id: params[:category_id])
        @todo = @category.todos.build(todos_params)
        if @todo.save
            redirect_to @category
        else
            render "category/show"
        end
    end
   
   def edit
      @category = Category.find_by(params[:category_id])
      @todo =@category.todos.find_by(params[:id])
   end
   
   def update
      @category = Category.find_by(params[:category_id])
      @todo =@category.todos.find_by(params[:id])
       @todo.update(todos_params)
       redirect_to @category
   end
   
   def destroy
      @category = Category.find_by(params[:id])
      @todo =@category.todos.find_by(params[:id])
      
       @todo.destroy
       redirect_to @category
   end
   
   private

    def todos_params
      params.require(:todo).permit(:content)
    end
    
    

    
end
    




