require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ViewComponentSandbox
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end

    config.i18n.default_locale = :ja
    config.time_zone = "Asia/Tokyo"

    config.action_view.field_error_proc = proc { |html_tag, _instance| html_tag }

    config.view_component.preview_paths << "#{Rails.root}/spec/components/previews"

    # haml-rails を入れているので明示
    config.app_generators.template_engine :erb

    # https://qiita.com/kyntk/items/b7617e9eb959c44ecf16
    # Rails v7.1からは別の書き方がある
    lib = root.join("lib")
    config.autoload_paths << lib
    config.eager_load_paths << lib
    Rails.autoloaders.main.ignore(
      lib.join("assets"),
      lib.join("tasks")
    )
  end
end

require "view_component"
require "primer/view_components/engine"
