class GankItem < ApplicationRecord
  belongs_to :gank_type
  validates :url, presence: true
  validates :title, presence: true
end
