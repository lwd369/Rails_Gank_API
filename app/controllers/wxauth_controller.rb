class WxauthController < ApplicationController
  def new
   url = Pingpp::WxPubOauth.create_oauth_url_for_code('wx8b5bf8c6c3f7ad8c', 'http://www.lwd369.com/getopenid?showwxpaytitle=1', more_info=true)
   redirect_to url
  end

  def getopenid
    openid, error = Pingpp::WxPubOauth.get_openid('wx8b5bf8c6c3f7ad8c', 'd4624c36b6795d1d99dcf0547af5443d', params[:code])
    render text: openid
  end
end
