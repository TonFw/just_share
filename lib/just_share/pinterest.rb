class JustShare::Pinterest < JustShare::SocialLinker
  def setup_attrs
    # Base URL
    self.domain='http://pinterest.com'
    self.path='pin/create/bookmarklet'

    # Params (only the link is working, the others are deprecated for the sharer.php & won't work)
    url_param = "url=#{self.link}"
    description_param = "description=#{self.message}"
    image_param = "media=#{self.image_url}"

    # build the params
    self.params = "#{url_param}&#{description_param}&#{image_param}"
  end
end