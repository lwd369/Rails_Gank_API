module DataCollectorHelper
  GANK_API = "http://gank.io"
  PUBLISHED_DATES = "/api/day/history"
  DAILY_TIMES = "/api/day/"

  def get_published_dates
    conn = getFaradayInstance
    response = conn.get PUBLISHED_DATES
    response.body
  end

  def get_item_at(date)
    date_string = date.to_s
    date_string.gsub!(/-/,'/')
    conn = getFaradayInstance
    response = conn.get (DAILY_TIMES + date_string[0..9])
    return response.body
  end

  def get_current_date
    Date.today.to_s.gsub(/-/,'/')
  end

  private
    def getFaradayInstance
      conn = Faraday.new(url: GANK_API) do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
      return conn
    end
end