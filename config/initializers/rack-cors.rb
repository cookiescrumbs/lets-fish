## Configure Rack CORS Middleware, so that CloudFront can serve our assets.
## See https://github.com/cyu/rack-cors

if defined? Rack::Cors
    Rails.configuration.middleware.insert_before 0, Rack::Cors do
        allow do
            origins '*'
            # origins %w[
            #     https://lets.fish
            #     http://lets.fish
            #     https://www.lets.fish
            #     http://www.lets.fish
            # ]
            resource '*', headers: :any, methods: [:get, :options]
        end
    end
end
