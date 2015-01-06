# Libs/Gems or Ruby classes for it GEM
require 'json'
require 'rest_client'

# Gem files
[:version, :string, :social_linker, :blogger, :delicious, :facebook, :google_plus, :pinterest, :tumblr, :twitter].each { |lib| require "just_share/#{lib}" }

# Module to have "global accessible vars to it gem scope"
module JustShare
  # Attrs to ConfigThe Module & reuse those attrs
  @via
  @link
  @message
  @hash_tags
  @image_url

  # Facade method to create the links
  def self.on(params={})
    # SetUp the params if those attrs are empty
    @via = params[:via]  unless params[:via].nil?
    @link = params[:link] unless params[:link].nil?
    @message = params[:message]  unless params[:message].nil?
    @hash_tags = params[:hash_tags] unless params[:hash_tags].nil?
    @image_url = params[:image_url] unless params[:image_url].nil?

    # Dynamic instantiate the social network & get it generated link
    social_network = "JustShare::#{params[:social].to_s.capitalize_humanized}".to_constant.new params
    social_network.get_post_link
  end

  # Convert it array to a simple String to be a GET HTTP param
  def self.array_to_str_params input_array
    aux_array = input_array.split(',') if input_array.is_a?String
    aux_array.is_a?String ? return input_array : input_array = aux_array
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
    @hash_tags = hash_tags if hash_tags.is_a?Array
    @hash_tags = [] if @hash_tags.nil?
    @hash_tags.append(hash_tags) unless hash_tags.is_a?Array
  end

  def self.via
    @via
  end

  def self.link
    @link
  end
  
  def self.message
    @message
  end

  def self.image_url
    @image_url
  end

  def self.hash_tags
    @hash_tags.nil? ? @hash_tags=[] : @hash_tags
  end
end