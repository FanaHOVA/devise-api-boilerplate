require File.expand_path('../boot', __FILE__)

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DeviseApiBoilerplate
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec
    end

    config.middleware.insert_before 0, 'Rack::Cors' do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end

    ActiveModel::Serializer.config.adapter = :json

    config.active_record.raise_in_transactional_callbacks = true
  end
end
