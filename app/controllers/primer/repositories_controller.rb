module Primer
  class RepositoriesController < Primer::ApplicationController
    before_action :set_repository, only: %i[show edit update destroy]

    def index
      @repositories = Repository.all
    end

    def show; end

    def new
      @repository = Repository.new
    end

    def edit; end

    def create
      @repository = Repository.new(repository_params)

      if @repository.save
        redirect_to primer_repository_path(@repository), notice: t("flash.created", model: Repository.model_name.human)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @repository.update(repository_params)
        redirect_to primer_repository_path(@repository), notice: t("flash.updated", model: Repository.model_name.human), status: :see_other
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @repository.destroy!
      redirect_to primer_repositories_path, notice: t("flash.destroyed", model: Repository.model_name.human), status: :see_other
    end

    private

    def set_repository
      @repository = Repository.find(params[:id])
    end

    def repository_params
      params.require(:repository).permit(:user_id, :name, :description, :status)
    end
  end
end
