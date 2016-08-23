class DataCollectorController < ApplicationController
  include DataCollectorHelper

  def hello
    render text: "Hello lwd369"
  end

  def getPublishDates
#    init_save_dates
  end

  def saveGankItem
#    init_save_items
  end

  def update_daily_data
    response = get_item_at(Date.today)
    result_json = ActiveSupport::JSON.decode response
    category = result_json["category"]
    results = result_json["results"]
    if category.empty? || results.empty?
      render text: "今日没有数据"
    elsif
      save_items(category, results)
    end
  end

  private
  def loopAllDates
    dates = PublishDate.all
    dates.each do |date|
      yield date.publish_date
    end
  end

  def init_save_items
    loopAllDates do |date|
      response = get_item_at date
      json = ActiveSupport::JSON.decode response
      category = json["category"]
      results = json["results"]

      category.each do |c|
        unless GankType.find_by_title(c)
          GankType.create!(title: c)
        end
      end


      category.each do |type|
        gank_type = GankType.find_by_title(type)
        type_result = results[type]
        type_result.each do |item|
          hash = {item_id: item["_id"],
                  title: item["desc"],
                  source: item["source"],
                  url: item["url"],
                  who: item["who"],
                  published_date: item["publishedAt"]}
          gank_type.gank_items.create!(hash)
        end
      end
    end
    render text: "complete"
  end

  def init_save_dates
    json = ActiveSupport::JSON.decode get_published_dates
    dates = json["results"]
    dates.reverse!
    dates.each do |date|
      PublishDate.create!(publish_date: date)
    end
    render text: "save completed!"
  end

  def save_items(category, results)
    category.each do |c|
      unless GankType.find_by_title(c)
        GankType.create!(title: c)
      end
    end


    arrs = []
    category.each do |type|
      gank_type = GankType.find_by_title(type)
      type_result = results[type]
      type_result.each do |item|
        hash = {item_id: item["_id"],
                title: item["desc"],
                source: item["source"],
                url: item["url"],
                who: item["who"],
                published_date: item["publishedAt"]}
        gank_type.gank_items.create!(hash)
        arrs.append hash
      end
    end
    render json:arrs
  end
end
