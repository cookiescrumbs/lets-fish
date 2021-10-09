LetsFish::Application.configure do
    # Settings specified here will take precedence over those in config/application.rb.
  
    # Code is not reloaded between requests.
    config.cache_classes = true
  
    # Eager load code on boot. This eager loads most of Rails and
    # your application in memory, allowing both thread web servers
    # and those relying on copy on write to perform better.
    # Rake tasks automatically ignore this option for performance.
    config.eager_load = true
  
    # Full error reports are disabled and caching is turned on.
    config.consider_all_requests_local       = false
    config.action_controller.perform_caching = true
  
    #cloud front
    config.action_controller.asset_host = ENV['ASSET_HOST']
  
    # Disable serving static files from the `/public` folder by default since
    # Apache or NGINX already handles this.
    config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
    if ENV["RAILS_LOG_TO_STDOUT"].present?
      logger           = ActiveSupport::Logger.new(STDOUT)
      logger.formatter = config.log_formatter
      config.logger = ActiveSupport::TaggedLogging.new(logger)
    end
  
  
    # cache static assets for 30 days - 2592000 seconds
    config.public_file_server.headers = {
      'Access-Control-Allow-Origin' => ENV['ASSET_HOST'],
      'Access-Control-Request-Method' => %w{GET OPTIONS}.join(","),
      'Cache-Control' => 'public, max-age=2592000',
      'Expires' => "#{1.year.from_now.to_formatted_s (:rfc822)}"
    }
  
    config.assets.prefix = '/assets'
  
    # Compress JavaScripts and CSS.
    config.assets.js_compressor = :uglifier
    # config.assets.css_compressor = :sass
  
    # Do not fallback to assets pipeline if a precompiled asset is missed.
    config.assets.compile = false
    #config.assets.compile = true
    # config.assets.precompile = ['*.js', '*.css', '*.css.erb']
  
    # Generate digests for assets URLs.
    config.assets.digest = true
  
    # Version of your assets, change this if you want to expire all your assets.
    config.assets.version = '1.0'
  
    # Specifies the header that your server uses for sending files.
    # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
    # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx
  
    # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
    config.force_ssl = true
  
    # Set to :debug to see everything in the log.
    config.log_level = :info
  
    # Prepend all log lines with the following tags.
    # config.log_tags = [ :subdomain, :uuid ]
  
    # Use a different logger for distributed setups.
    # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)
  
    # Use a different cache store in production.
    config.cache_store = :memory_store, { size: 32.megabytes }
  
    # Enable serving of images, stylesheets, and JavaScripts from an asset server.
    # config.action_controller.asset_host = "http://assets.example.com"
  
    # Precompile additional assets.
    # application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
    # config.assets.precompile += %w( homepage.js search.js )
  
    # Ignore bad email addresses and do not raise email delivery errors.
    # Set this to true and configure the email server for immediate delivery to raise delivery errors.
    # config.action_mailer.raise_delivery_errors = false
  
    # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
    # the I18n.default_locale when a translation can not be found).
    config.i18n.fallbacks = true
  
    # Send deprecation notices to registered listeners.
    config.active_support.deprecation = :notify
  
    # Disable automatic flushing of the log to improve performance.
    # config.autoflush_log = false
  
    # Use default logging formatter so that PID and timestamp are not suppressed.
    config.log_formatter = ::Logger::Formatter.new
  
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
  
  end
