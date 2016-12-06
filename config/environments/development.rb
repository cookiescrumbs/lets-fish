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
    bucket: 'lets-fish',
    url: ':s3_domain_url',
    path: '/:class/:attachment/:id_partition/:style/:filename'
  }

  config.geograph_api_key = 'a5ecd893c8'
  config.dark_sky_api_key = '0a41a01031a5b6fa9241b180875eb218'
  config.google_api_key = 'AIzaSyAbQz9wmM_wnPdi4Q8-dlbDOyDeS10zb58'
  config.google_api_key_browser = 'AIzaSyCflXBfzx_Gvy2f-DiCeymxmqp7P4BOHws'

  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
end
