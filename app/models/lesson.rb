class Lesson < ApplicationRecord
  belongs_to :product, optional: true
  has_many :lesson_blocks, -> { order(position: :asc) }, dependent: :nullify
end
