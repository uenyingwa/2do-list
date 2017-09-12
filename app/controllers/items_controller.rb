class ItemsController < ApplicationController
  before_action :set_todo
  before_action :set_todo_item, only: [:show, :update, :destroy]
  def index
    json_response(@todo.items)
  end

  def show
    return json_response(@item) if @item
    json_response({}, :not_found)
  end

  def create
    @todo.items.create!(item_params)
    json_response(@todo, :created)
  end

  def update
    updated_item = @item.update(item_params) if @item
    return json_response(updated_item, :ok) if @item
    json_response({}, :not_found)
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:name, :done)
  end

  def set_todo
    @todo = Todo.find(params[:todo_id])
  end

  def set_todo_item
    @item = @todo.items.find_by(id: params[:id]) if @todo
  end
end
