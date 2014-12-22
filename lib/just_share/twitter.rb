class JustShare::Twitter < JustShare::SocialLinker
  def setup_attrs
    # Base URL
    self.domain='https://twitter.com'
    self.path='intent/tweet'

    # Params (only the link is working, the others are deprecated for the sharer.php & won't work)
    via_param = "via=#{self.via}" # IMPORTANT: be the App? Like PageRenter?
    url_param = "url=#{self.link}"
    text_param = "text=#{self.message}"
    hash_tag_param = "hashtags=#{JustShare.array_to_str_params self.hash_tags}"

    # build the params
    self.params = "#{text_param}&#{url_param}&#{via_param}&#{hash_tag_param}"
  end
end