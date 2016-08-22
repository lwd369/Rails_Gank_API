class PublishDate < ApplicationRecord
  validates :publish_date, presence: true, uniqueness: true
end
