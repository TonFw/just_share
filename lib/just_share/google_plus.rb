class JustShare::GooglePlus < JustShare::SocialLinker
  def setup_attrs
    # Base URL
    self.domain='https://plus.google.com'
    self.path='share'

    # Params (only the link is working, the others are deprecated for the sharer.php & won't work)
    url_param = "url=#{self.link}"

    # build the params
    self.params = "#{url_param}"
  end
end