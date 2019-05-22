class Review < ApplicationRecord
  belongs_to :restaurant
  REVIEW_NOTATION = [0, 1, 2, 3, 4, 5]
  validates :rating, presence: true, inclusion: { in: REVIEW_NOTATION }, numericality: { only_integer: true }
  validates :content, presence: true
end
