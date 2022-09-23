class Lesson < ApplicationRecord
  belongs_to :product, optional: true
  has_many :lesson_blocks, -> { order(position: :asc) }, dependent: :nullify
  has_many :study_sessions, dependent: :destroy

  belongs_to :course, optional: true
  acts_as_list scope: :course

  def this_lesson_study_session?(study_session)
    self.id === study_session.lesson_id ? true : false
  end

end
