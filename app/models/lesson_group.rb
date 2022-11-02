class LessonGroup < ApplicationRecord
  belongs_to :lesson
  has_many :lesson_blocks, -> { order(position: :asc) }, dependent: :nullify
  has_many :study_sessions, dependent: :destroy
  
  acts_as_list scope: :lesson
end
