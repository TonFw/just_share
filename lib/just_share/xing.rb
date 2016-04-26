class JustShare::Xing < JustShare::SocialLinker
  def setup_attrs
    # Base URL
    self.domain='https://www.xing.com'
    self.path='/spi/shares/new'

    # Params (only the link is working, the others are deprecated for the sharer.php & won't work)
    url_param = "url=#{self.link}"

    # build the params
    self.params = "#{url_param}"
  end
end