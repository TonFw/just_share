# Libs/Gems or Ruby classes for it GEM
require 'json'
require 'curl'
require 'rest_client'

# Gem files
[:version, :delicious, :facebook, :google_plus, :pinterest, :tumblr, :twitter].each { |lib| require "just_share/#{lib}" }

# Module to have "global accessible vars to it gem scope"
module JustShare
  # Facade method to create the links
  def self.on(params={})

  end
end