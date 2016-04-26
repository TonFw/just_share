class JustShare::Facebook < JustShare::SocialLinker
  def setup_attrs
    # Base URL
    self.domain='https://www.facebook.com'
    self.path='sharer/sharer.php'

    # Params (only the link is working, the others are deprecated for the sharer.php & won't work)
    url_param = "u=#{self.link}"

    # build the params
    self.params = "#{url_param}"
  end

  def self.invite_friends(app_id, msg, redir_url)
    # Base URL
    domain='https://www.facebook.com'
    path='dialog/apprequests'
    params = "app_id=#{app_id}&message=#{msg}&redirect_uri=#{redir_url}"

    "#{domain}/#{path}?#{params}"
  end
end