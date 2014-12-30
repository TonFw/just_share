class JustShare::LinkedIn < JustShare::SocialLinker
  def setup_attrs
    # Base URL
    self.domain='https://www.linkedin.com'
    self.path='shareArticle'

    # Params (for twitter it is possible set more params on URL, but to more style check it tags documentation)
    url_param = "url=#{self.link}"
    title_param = "title=#{self.title}"
    text_param = "summary=#{self.message}"
    image_param = "source=#{self.image_url}"

    # build the params
    self.params = "mini=true&#{url_param}&#{title_param}&#{text_param}&#{image_param}"
  end
end