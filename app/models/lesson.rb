class Lesson < ApplicationRecord
  validates :position, presence: true
  belongs_to :product
end
