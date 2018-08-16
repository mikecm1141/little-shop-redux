ENV["RACK_ENV"] ||= "test"

require 'bundler'

Bundler.require(:default, :test)

require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'

Capybara.app = LittleShopApp
Capybara.save_path = "tmp/capybara"

DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.include Capybara::DSL
  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
end

Shoulda::Matchers.configure do |config|
 config.integrate do |with|
   with.test_framework :rspec

   with.library :active_record
   with.library :active_model
   # with.library :action_controller
 end
end
