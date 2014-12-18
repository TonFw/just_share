module Helpers
  def accessible? url
    resp = RestClient.get url
    resp.code == 200 ? true : false
  end
end