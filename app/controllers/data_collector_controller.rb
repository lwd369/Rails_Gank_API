class DataCollectorController < ApplicationController
  include DataCollectorHelper

  def hello
    render text: "Hello goo~~"    
  end

  def getPublishDates
    json = ActiveSupport::JSON.decode get_published_dates
    dates = json["results"]
    dates.reverse!
    dates.each do |date|
      PublishDate.create!(publish_date: date)
    end
    render text: "save completed!"
  end

  def saveGankItem
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

  private
  def loopAllDates
    dates = PublishDate.all
    dates.each do |date|
      yield date.publish_date
    end
  end
end
