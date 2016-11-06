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

module EverydayRailsRspecExercise
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do|g|
      g.test_framework :rspec,
      fixtures: true,
      # fixtures: true specifies to generate a fixture for each model (using a Factory Girl factory, instead of an actual fixture)
      view_specs: false,
      # view_specs: false says to skip generating view specs. I won’t cover them in this book; instead we’ll use feature specs to test interface elements.
      helper_specs: false,
      # helper_specs: false skips generating specs for the helper files Rails generates with each controller. As your comfort level with RSpec improves, consider changing this option to true and testing these files.
      routing_specs: false,
      # routing_specs: false omits a spec file for your config/routes.rb file. If your application is simple, as the one in this book will be, you’re probably safe skipping these specs. As your application grows, however, and takes on more complex routing, it’s a good idea to incorporate routing specs.
      controller_specs: true,
      request_specs: false
      # request_specs: false skips RSpec’s defaults for adding integration-level specs in spec/requests. We’ll cover this in chapter 8, at which time we’ll just create our own files.
      g.fixture_replacement :factory_girl, dir: "spec/factories"
      # And finally, g.fixture_replacement :factory_girl tells Rails to generate factories instead of fixtures, and to save them in the spec/factories directory.

    end
  end
end
