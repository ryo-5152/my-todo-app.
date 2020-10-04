class TodosController < ApplicationController


   def create
       @category = Category.find_by(params[:id])
       @todo = @category.todos.build(todos_params) 
       @todos = @category.todos.all
    
       @todo.save


       redirect_to @category
    
    
   end
   
   def edit
      @category = Category.find_by(params[:id])
      @todo =@category.todos.find_by(id: params[:id])
   end
   
   def update
      @category = Category.find_by(params[:id])
      @todo =@category.todos.find_by(id: params[:id])
       @todo.update(todos_params)
       redirect_to @category
   end
   
   def destroy
      @category = Category.find_by(params[:id])
      @todo =@category.todos.find_by(id: params[:id])
      
       @todo.destroy
       redirect_to @category
   end
   
   private

    def todos_params
      params.require(:todo).permit(:content)
    end
    

    
end
    
