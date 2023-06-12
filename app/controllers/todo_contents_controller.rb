class TodoContentsController < ApplicationController

  def new
    @todo_content = TodoContent.new
    @todo_lists = TodoList.all
  end

  def create
    @todo_content = TodoContent.new(todo_content_params)
    # todo_list(タイトル)を選択
    if params[:todo_content][:select_button] == "selected"
      @todo_list = TodoList.find(params[:todo_content][:todo_list_id])
      @todo_content.todo_list_id = @todo_list.id
    # 新しくtodo_listを作る
    elsif params[:todo_content][:select_button] == "new"
      @title = params[:todo_content][:title]
      if @title.nil?
        @todo_lists = TodoList.all
        render :new
        return
      else
        # todo_listの新規作成
        @new_todo_list = TodoList.new
        @new_todo_list.title = @title
        @new_todo_list.save
        @todo_content.todo_list_id = @new_todo_list.id
      end

    else
      redirect_to request.referer
      return
    end

    if @todo_content.save
      redirect_to todo_list_path(@todo_content.todo_list_id)
    else
      # todo_contentの作成が失敗した時に
      # 新しく作成したtodo_listのみ作成がされてしまうので
      # 状態を戻すために削除する
      if @new_todo_list.present?
        @new_todo_list.destroy
        @todo_lists = TodoList.all
        render :new
        return
      else
        @todo_lists = TodoList.all
        render :new
      end
    end
  end

  def destroy
    @todo_content = TodoContent.find(params[:id])
    @todo_content.destroy
    redirect_to request.referer
  end


  # def new_content
  #   @todo_content = TodoContent.new
  #   @todo_list_id = params[:id]
  # end


  # def add_content
  #   todo_content = TodoContent.new(todo_content_params)
  #   # @todo_list_id = params[:id]

  #   # todo_content.todo_list_id = @todo_list_id

  #   if todo_content.save
  #     redirect_to todo_list_path(todo_content.todo_list_id)
  #   else
  #     render :new
  #   end
  # end


  private

  def todo_content_params
    params.require(:todo_content).permit(:content, :todo_list_id)
  end


end
