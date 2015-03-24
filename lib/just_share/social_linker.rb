require 'cgi'

# ParentClass which have the attrs to create the links
class JustShare::SocialLinker
  # Attrs accessor for it classes
  attr_accessor :title # title on the message
  attr_accessor :message # Base Message (like from the Ad.social_message)
  attr_accessor :aux_link # The redirect link on the post
  attr_accessor :via # The app which post like: PageRenter
  attr_accessor :hash_tags # Array of HashTags, like nature, sunset, HereWeGo...
  attr_accessor :image_url # URL to the image

  # Attrs filled on children
  attr_accessor :domain # ex: facebook.com twitter.com ...
  attr_accessor :path # ex: facebook.com twitter.com ...
  attr_accessor :params # ex: facebook.com twitter.com ...

  # It constructor must be reused by it children
  def initialize(params={})
    # SetUp the attrs
    self.via=params[:via] || self.via=JustShare.via
    self.aux_link=params[:link] || self.aux_link=JustShare.link
    self.title=params[:title] || self.message=JustShare.title
    self.message=params[:message] || self.message=JustShare.message
    self.hash_tags=params[:hash_tags] || self.hash_tags=JustShare.hash_tags
    self.image_url=params[:image_url] || self.hash_tags=JustShare.image_url
    self.hash_tags = JustShare.hash_tags if self.hash_tags.nil? || params[:hash_tags].nil?
  end

  # FacadeMethod
  def get_post_link
    # SetUp attrs
    setup_attrs
    # Create & return it URL created
    "#{self.domain}/#{self.path}?#{params}"
  end

  # Overwriting the link getter to return it encoded as HTTP uses
  def link
    CGI::escape(self.aux_link) unless self.aux_link.nil?
  end

  # Method to be implemented on it children!
  def setup_attrs
  end
end