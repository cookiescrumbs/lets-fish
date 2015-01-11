require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'
require 'site_prism'

#require page objects
Dir[Rails.root.join("spec/page_objects/**/*.rb")].each { |f| require f }

Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|
 config.include Capybara::DSL
end
