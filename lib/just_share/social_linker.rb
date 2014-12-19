# ParentClass which have the attrs to create the links
class JustShare::SocialLinker
  # Attrs accessor for it classes
  attr_accessor :title # Title on the post
  attr_accessor :message # Base Message (like from the Ad.social_message)
  attr_accessor :link # The redirect link on the post
  attr_accessor :via # The app which post like: PageRenter
  attr_accessor :image_url # The image to be shown

  # Attrs filled on children
  attr_accessor :domain # ex: facebook.com twitter.com ...
  attr_accessor :path # ex: facebook.com twitter.com ...

  # It constructor must be reused by it children
  def initialize(params={})
    # SetUp the attrs
    self.via=params[:via]
    self.link=params[:link]
    self.title=params[:title]
    self.message=params[:message]
    self.image_url=params[:image_url]
  end

  # Method to be implemented on it children!
  def get_post_link
  end
end