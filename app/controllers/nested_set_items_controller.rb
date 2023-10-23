class NestedSetItemsController < ApplicationController
  layout "my_models"

  def index
    @nested_set_items = NestedSetItem.then { params[:type] == "roots" ? _1.roots : _1 }.order(:created_at)

    render NestedSetItemTreeComponent.new(items: @nested_set_items, is_children: false) if params[:type] == "roots"
  end
end
