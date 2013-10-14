require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module Shopen
  class Application < Rails::Application
    config.i18n.default_locale = :en
    config.assets.paths << File.join(Rails.root, 'app', 'assets', 'templates')
  end
end
