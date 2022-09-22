class Lesson < ApplicationRecord
  belongs_to :product, optional: true
  has_many :lesson_blocks, -> { order(position: :asc) }, dependent: :nullify
  has_many :study_sessions, dependent: :destroy

  belongs_to :course, optional: true
  acts_as_list scope: :course
end
