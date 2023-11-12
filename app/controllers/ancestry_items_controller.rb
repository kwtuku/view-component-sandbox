class AncestryItemsController < ApplicationController
  include MyModelsLayout

  def index
    @ancestry_items = AncestryItem.then { params[:type] == "roots" ? _1.roots : _1 }.order(:created_at)

    render AncestryItemTreeComponent.new(items: @ancestry_items, is_children: false) if params[:type] == "roots"
  end
end
