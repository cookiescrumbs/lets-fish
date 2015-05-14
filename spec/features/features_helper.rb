require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'
require 'site_prism'

#require page objects
Dir[Rails.root.join("spec/page_objects/**/*.rb")].each { |f| require f }

Capybara.javascript_driver = :poltergeist
Capybara.ignore_hidden_elements = false
RSpec.configure do |config|
 config.include Capybara::DSL

  # config.before(:suite) do
  #   DatabaseCleaner.strategy = :truncation
  #   DatabaseCleaner.clean_with(:truncation)
  # end

end
