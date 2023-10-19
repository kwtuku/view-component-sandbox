class MyPgModelsController < ApplicationController
  layout "my_models"
  before_action :set_my_pg_model, only: %i[show edit update destroy]

  def index
    @my_pg_models = MyPgModel.all
  end

  def show; end

  def new
    @my_pg_model = MyPgModel.new
  end

  def edit; end

  def create
    @my_pg_model = MyPgModel.new(my_pg_model_params.merge(my_daterange: Date.current.all_day, my_interval: 1.day))

    if @my_pg_model.save
      redirect_to my_pg_model_path(@my_pg_model), notice: t("flash.created", model: MyPgModel.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @my_pg_model.update(my_pg_model_params.merge(my_daterange: Date.current.all_day, my_interval: 1.day))
      redirect_to my_pg_model_path(@my_pg_model), notice: t("flash.updated", model: MyPgModel.model_name.human), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @my_pg_model.destroy!
    redirect_to my_pg_models_path, notice: t("flash.destroyed", model: MyPgModel.model_name.human), status: :see_other
  end

  private

  def set_my_pg_model
    @my_pg_model = MyPgModel.find(params[:id])
  end

  def my_pg_model_params
    params.require(:my_pg_model).permit(
      :my_model_id, :my_binary, :my_string_array, :my_text_array, :my_integer_array, :my_json, :my_jsonb, :my_daterange, :my_uuid, :my_interval,
    )
  end
end
