ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'

ActiveRecord::Migration.maintain_test_schema!

# include capybara and database cleaner
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  # Fix the bug that delete some meta data causing 'environment' issue
  # Base on solution in this link: https://github.com/DatabaseCleaner/database_cleaner/issues/445
  config.before(:suite) { DatabaseCleaner.clean_with(:truncation, except: %w(ar_internal_metadata)) }
  config.before(:each) { DatabaseCleaner.strategy = :transaction }
  config.before(:each, :js => true) { DatabaseCleaner.strategy = :truncation }
  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  # for some reason, 'root_path' is not define in rspec, this line include the route variables to fix
  config.include Rails.application.routes.url_helpers
  # for some reason, require capybara does not access those function, this line is a fix
  config.include Capybara::DSL
end