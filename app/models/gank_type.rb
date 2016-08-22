class GankType < ApplicationRecord
  has_many :gank_items

  validates :title, presence: true
end
