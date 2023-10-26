class NestedSetItemsController < ApplicationController
  layout "my_models"

  def index
    @nested_set_items = NestedSetItem.then do |item|
      if params[:type] == "roots"
        # FIXME: preload の引数は depth を使って表現できそう
        item.roots.preload(children: { children: { children: :children } })
      else
        item.order(:created_at)
      end
    end

    render NestedSetItemTreeComponent.new(items: @nested_set_items, is_children: false) if params[:type] == "roots"
  end
end
