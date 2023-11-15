class MyListItemsController < ApplicationController
  include MyModelsLayout

  def index
    @my_list_items = MyListItem.order(:my_scope, :position)
  end

  def move
    my_list_item = MyListItem.find(params[:id])
    my_list_item.insert_at!(params[:new_index].to_i + 1)

    @my_list_items = MyListItem.order(:my_scope, :position)
  end
end
