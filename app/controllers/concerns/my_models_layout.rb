module MyModelsLayout
  extend ActiveSupport::Concern

  included do
    layout "my_models"
  end

  private

  def default_url_options
    { navbar: params[:navbar] }
  end
end
