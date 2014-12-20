# Libs/Gems or Ruby classes for it GEM
require 'json'
require 'rest_client'

# Gem files
[:version, :string, :social_linker, :delicious, :facebook, :google_plus, :pinterest, :tumblr, :twitter].each { |lib| require "just_share/#{lib}" }

# Module to have "global accessible vars to it gem scope"
module JustShare
  # Attrs to ConfigThe Module & reuse those attrs
  @via
  @link
  @message
  @hash_tags

  # Facade method to create the links
  def self.on(params={})
    # SetUp the params if those attrs are empty
    @via = params[:via]  unless params[:via].nil?
    @link = params[:link] unless params[:link].nil?
    @message = params[:message]  unless params[:message].nil?

    # Dynamic instantiate the social network & get it generated link
    social_network = "JustShare::#{params[:social].to_s.capitalize_humanized}".to_constant.new params
    social_network.get_post_link
  end

  # Convert it array to a simple String to be a GET HTTP param
  def array_to_str_params input_array
    return_str = '' # init
    input_array.each { |item| return_str="#{return_str}#{item}," }
    return_str # return
  end

  # Static methods to set the Attrs (it means not necessary those attrs in the 'on' method)
  def self.via=(via)
    @via=via
  end

  def self.link=(link)
    @link=link
  end

  def self.message=(message)
    @message=message
  end

  def self.hash_tags=(hash_tags)
    @hash_tags=hash_tags
  end

  def self.via
    @via
  end

  def self.link_url
    @link
  end
  
  def self.message
    @message
  end

  def self.hash_tags
    @hash_tags.nil? ? @hash_tags=[] : @hash_tags
  end
end