require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module LetsFish
  class Application < Rails::Application

    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

     # Enable serving of images, stylesheets, and JavaScripts from an asset server.
    config.action_controller.asset_host = "http://dur8xuaowfaya.cloudfront.net"

    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins "http://dur8xuaowfaya.cloudfront.net"
        resource '*', :headers => :any, :methods => [:get, :options]
      end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.enforce_available_locales = true
    config.admin = 'admin'
    config.fishery_manager = 'fishery manager'
    config.active_job.queue_adapter = :sidekiq
  end
end
