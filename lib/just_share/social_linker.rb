# ParentClass which have the attrs to create the links
class JustShare::SocialLinker
  # Attrs accessor for it classes
  attr_accessor :domain # ex: facebook.com twitter.com ...
  attr_accessor :message # Base Message (like from the Ad.social_message)
  attr_accessor :link # The redirect link on the post
  attr_accessor :via # The app which post like: PageRenter

  # It constructor must be reused by it childs
  def initialize(params={})
    # SetUp the attrs
    self.via=params[:via]
    self.link=params[:link]
    self.domain=params[:domain]
    self.message=params[:message]
  end
end