require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'
require 'rack_session_access/capybara'
require 'selenium-webdriver'
require 'site_prism'

include ActionDispatch::TestProcess

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

# require page objects
Dir[Rails.root.join('spec/page_objects/**/*.rb')].each { |f| require f }

# Capybara.default_wait_time = 60
Capybara.javascript_driver = :selenium
Capybara.ignore_hidden_elements = false
RSpec.configure do |config|
  config.include Capybara::DSL
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end
end
