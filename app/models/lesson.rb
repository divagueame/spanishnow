class Lesson < ApplicationRecord
  belongs_to :product, optional: true
  has_many :blocks, -> { order(position: :asc) }
end
