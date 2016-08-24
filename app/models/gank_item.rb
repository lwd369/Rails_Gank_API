class GankItem < ApplicationRecord
  belongs_to :gank_type
  validates :url, presence: true
  validates :title, presence: true
  validates :item_id, uniqueness: true
end
