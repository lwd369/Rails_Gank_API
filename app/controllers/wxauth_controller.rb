class WxauthController < ApplicationController
  def new
   url = Pingpp::WxPubOauth.create_oauth_url_for_code('wx8b5bf8c6c3f7ad8c', 'http://www.lwd369.com/getopenid?showwxpaytitle=1')
   redirect_to url
  end

  def getopenid
    openid, error = Pingpp::WxPubOauth.get_openid('WX_PUB_APP_ID', 'WX_PUB_APP_SECRET', params[:code])
    render text: openid
  end
end
