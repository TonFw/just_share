class JustShare::Blogger < JustShare::SocialLinker
  def setup_attrs
    # Base URL
    self.domain='https://www.blogger.com'
    self.path='blog_this.pyra'

    # Params (only the link is working, the others are deprecated for the sharer.php & won't work)
    url_param = "u=#{self.link}"
    description_param = "n=#{self.message}"

    # build the params
    self.params = "#{url_param}&#{description_param}"
  end
end