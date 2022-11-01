# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Load image upload carrierwave
require "carrierwave/orm/activerecord"
