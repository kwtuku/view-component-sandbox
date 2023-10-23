class NestedSetItemsController < ApplicationController
  layout "my_models"

  def index
    @nested_set_items = NestedSetItem.order(:created_at)
  end
end
