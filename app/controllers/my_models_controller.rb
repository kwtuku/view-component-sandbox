class MyModelsController < ApplicationController
  layout "my_models"
  before_action :set_my_model, only: %i[show edit update destroy]

  def index
    @my_models = MyModel.all
  end

  def show; end

  def new
    @my_model = MyModel.new
  end

  def edit; end

  def create
    @my_model = MyModel.new(my_model_params)

    if @my_model.save
      redirect_to my_model_path(@my_model), notice: t("flash.created", model: MyModel.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @my_model.update(my_model_params)
      redirect_to my_model_path(@my_model), notice: t("flash.updated", model: MyModel.model_name.human), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @my_model.destroy!
    redirect_to my_models_path, notice: t("flash.destroyed", model: MyModel.model_name.human), status: :see_other
  end

  private

  def set_my_model
    @my_model = MyModel.find(params[:id])
  end

  def my_model_params
    params.require(:my_model).permit(:my_string, :my_text, :my_integer, :my_bigint, :my_float, :my_decimal, :my_datetime, :my_time, :my_date, :my_boolean)
  end
end
