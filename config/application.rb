require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TenureAndPromotion
  class Application < Rails::Application
    # Redirect to Fake CAS if one isn't specified
    config.rubycas.cas_base_url = ENV["CAS_BASE"] || "https://cas-unm.rhcloud.com/"
    # If there is no ENV["CAS_SERVICE"], RubyCAS will guess the local URL
    config.rubycas.service_url = ENV["CAS_SERVICE"] if ENV["CAS_SERVICE"]
    config.autoload_paths += %W(#{config.root}/lib)
    #config.rubycas.cas_base_url = 'https://cas-unm.rhcloud.com'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
     config.action_mailer.smtp_settings = {
       :address => "smtp.mandrillapp.com",
       :port => "587",
       :enable_starttls_auto => true,
       :user_name => ENV["MANDRILL_NAME"],
       :password => ENV["MANDRILL_KEY"],
       :authentication => "login",
       :domain => ENV["MANDRILL_DOMAIN"]
     }
  end
end
