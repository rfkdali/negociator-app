require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NegociatorTt
  class Application < Rails::Application
    config.eager_load_paths += Dir["#{config.root}/app/services/"]
    config.exceptions_app = self.routes

    config.generators do |g|
      g.skip_routes  true
      g.stylesheets = false
      g.javascripts = false
      g.view_specs = false
      g.helper = false
    end
  end
end