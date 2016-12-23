require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module F
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    Braintree::Configuration.environment = :sandbox
    Braintree::Configuration.merchant_id = ENV['BRAINTREE_MERCHANT_ID']
    Braintree::Configuration.public_key = ENV['BRAINTREE_PUBLIC_KEY']
    Braintree::Configuration.private_key = ENV['BRAINTREE_PRIVATE_KEY']
  end
end
