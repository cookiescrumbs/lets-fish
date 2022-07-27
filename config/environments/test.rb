LetsFish::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # The test environment is used exclusively to run your application's
  # test suite. You never need to work with it otherwise. Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs. Don't rely on the data there!
  config.cache_classes = true

  # Do not eager load code on boot. This avoids loading your whole application
  # just for the purpose of running a single test. If you are using a tool that
  # preloads Rails for running tests, you may have to set it to true.
  config.eager_load = false

  config.log_level = :warn

  # Configure static asset server for tests with Cache-Control for performance.
  config.public_file_server.headers = { 'Cache-Control' => 'public, max-age=3600' }

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment.
  config.action_controller.allow_forgery_protection = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Print deprecation notices to the stderr.
  config.active_support.deprecation = :stderr

  config.assets.raise_runtime_errors = true
  config.assets.raise_asset_errors = true

  config.geograph_api_key = 'a5ecd893c8'
  config.dark_sky_api_key = '0a41a01031a5b6fa9241b180875eb218'
  config.open_weather_api_key = '54321'
  config.google_api_key_browser = 'hsjhdfsjahfsjf'
  config.google_api_key_server = 'dsjfkdsfjdskjf'
  config.instagram_api_key = 'abcd12345'


  # https://guides.rubyonrails.org/active_record_multiple_databases.html#migrate-to-the-new-connection-handling
  config.active_record.legacy_connection_handling = false

end
