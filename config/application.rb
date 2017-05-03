require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# For all environments, run the following code
# configure do
#   # Load the following libraries
#   require 'omniauth-github'
#
#   # Load all .rb files in the app folder
#   # Dir[__dir__ + "/../app/**/*.rb"].each do |file|
#   #   require_relative file
#   # end
#
#   # Allow sessions and set a session secret
#   enable :sessions
#   set :session_secret, ENV['SESSION_SECRET']
#
#   # Declare the location of the views folder
#   # set :views, 'app/views'
#
#   # Set Github as an OmniAuth provider
#   use OmniAuth::Builder do
#     provider :github, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_CLIENT_SECRET'], scope: 'user:email'
#   end
# end

module TrainSchedule
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
