class TodoListsController < ApplicationController

  def index
    @todo_lists = TodoList.all
  end

  def show
    @todo_list = TodoList.find(params[:id])
    @todo_contents = TodoContent.where(todo_list_id: @todo_list.id)
  end

  def destroy
    @todo_list = TodoList.find(params[:id])
    @todo_list.destroy
    redirect_to todo_lists_path
  end

  def new_content
    @todo_content = TodoContent.new
    @todo_list_id = params[:id]
  end


  def add_content
    todo_content = TodoContent.new(todo_content_params)

    todo_content.todo_list_id = todo_list_id
    # todo_content.content = params[:content]

    if todo_content.save
      redirect_to todo_list_path(todo_content.todo_list_id)
    else
      render :new
    end
  end


  def new
    @todo_content = TodoContent.new
    @todo_list_id = params[:id]
  end


  def create
    @todo_content = TodoContent.new

    @todo_content.todo_list_id = @todo_list_id
    # todo_content.content = params[:content]

    if @todo_content.save
      redirect_to todo_list_path(@todo_content.todo_list_id)
    else
      render :new
    end
  end


  # private

  # def todo_content_params
  #   params.require(:todo_content).permit(:content, :todo_list_id)
  # end

end
