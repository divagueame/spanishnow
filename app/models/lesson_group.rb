class LessonGroup < ApplicationRecord
  belongs_to :lesson
  has_many :lesson_blocks, -> { order(position: :asc) }, dependent: :nullify
  
end
