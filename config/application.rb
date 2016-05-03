require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GetupClient
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :fr and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.default_locale = :fr

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    config.action_mailer.delivery_method = :smtp
    # SMTP settings for gmail
    config.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => 587,
      :user_name            => 'getup35ggnet@gmail.com',
      :password             => 'aze12_SDs)',
      :domain               => 'gmail.com',
      :authentication       => :login,
      :enable_starttls_auto => true
    }

    config.from = "contact@get-up.fr"
    config.destinataire = "contact@get-up.fr"

  end
end
