# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Set user name to GeoNamesAPI
GeoNamesAPI.username = ENV['USER_NAME']
