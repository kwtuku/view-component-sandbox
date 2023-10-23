class AncestryItemsController < ApplicationController
  layout "my_models"

  def index
    @ancestry_items = AncestryItem.order(:created_at)
  end
end
