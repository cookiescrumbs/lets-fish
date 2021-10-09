LetsFish::Application.configure do
  config.action_controller.perform_caching = false
  config.perform_caching = false
  config.cache_store = :null_store
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # cloud front
  # config.action_controller.asset_host = ENV['ASSET_HOST']

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load


  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  config.assets.raise_runtime_errors = true
  # Shows asset errors that you will get in production in the development environment
  config.assets.raise_asset_errors = true

  config.paperclip_defaults = {
    storage: :s3,
    s3_host_alias: ENV['ASSET_HOST'],
    url: ':s3_alias_url',
    path: '/:class/:attachment/:id_partition/:style/:filename',
    s3_region: ENV['S3_REGION'],
    s3_credentials: {
      bucket: ENV['S3_BUCKET_NAME'],
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    }
  }

  config.geograph_api_key = ENV['GEOGRAPH_API_KEY']
  config.open_weather_api_key = ENV['OPEN_WEATHER_API_KEY']
  config.dark_sky_api_key = ENV['DARK_SKY_API']
  config.google_api_key_browser = ENV['GOOGLE_API_KEY_BROWSER']
  config.instagram_api_key = ENV['INSTAGRAM_API_KEY']

  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
end
