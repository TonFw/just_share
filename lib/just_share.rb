# Libs/Gems or Ruby classes for it GEM
require 'json'
require 'rest_client'

# Gem files
[:version, :delicious, :facebook, :google_plus, :pinterest, :tumblr, :twitter].each { |lib| require "just_share/#{lib}" }

# Module to have "global accessible vars to it gem scope"
module JustShare
  # Attrs to ConfigThe Module & reuse those attrs
  @via
  @link
  @domain
  @message

  # Facade method to create the links
  def self.on(params={})
    # SetUp the params if those attrs are empty
    params[:via] = @via unless params[:via].nil?
    params[:link] = @link unless params[:link].nil?
    params[:domain] = @domain unless params[:domain].nil?
    params[:message] = @message unless params[:message].nil?

    # Dynamic instantiate the social network & get it generated link
    social_network = "Socials::#{params[:social].humanize}".constantize.new(params.except[:social])
    social_network.get_post_link
  end

  # Static methods to set the Attrs (it means not necessary those attrs in the 'on' method)
  def self.via=(via)
    @via=via
  end

  def self.link=(link)
    @link=link
  end

  def self.domain=(domain)
    @domain=domain
  end

  def self.message(message)
    @message=message
  end
end