class MyRankedModelsController < ApplicationController
  layout "my_models"

  def index
    @my_ranked_models = MyRankedModel.order(:my_scope, :row_order)
  end

  def move
    my_ranked_model = MyRankedModel.find(params[:id])
    my_ranked_model.update!(row_order_position: params[:new_index])

    @my_ranked_models = MyRankedModel.order(:my_scope, :row_order)
  end
end
