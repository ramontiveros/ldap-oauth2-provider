require_relative 'boot'

#require 'uri'
require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
# require "active_job/railtie"
require "active_record/railtie"
# require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module API
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    config.paths.add "app/api", glob: "**/*.rb"
    config.autoload_paths << "#{Rails.root}/app/api"
    config.autoload_paths << "#{Rails.root}/app/api/*/"

    config.eager_load_paths << "#{Rails.root}/app/api"
    config.eager_load_paths << "#{Rails.root}/app/api/*/"

    config.middleware.use Rack::Attack

  end
end
