class JustShare::Delicious < JustShare::SocialLinker
  def setup_attrs
    # Base URL
    self.domain='https://delicious.com'
    self.path='save'

    # Params (for twitter it is possible set more params on URL, but to more style check it tags documentation)
    url_param = "url=#{self.link}"
    title_param = "title=#{self.title}"
    tags_param = "tags=#{JustShare.array_to_str_params self.hash_tags}"
    text_param = "note=#{self.message}"

    # build the params
    self.params = "mini=true&#{url_param}&#{title_param}&#{tags_param}&#{text_param}"
  end
end