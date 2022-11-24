class Lesson < ApplicationRecord
  belongs_to :product, optional: true
  has_many :lesson_groups, -> { order(position: :asc) }, dependent: :nullify
  # has_many :lesson_blocks, through: :lesson_group
  has_one_attached :image, :dependent => :destroy


  belongs_to :course, optional: true
  acts_as_list scope: :course

  def this_lesson_study_session?(study_session)
    self.id === study_session.lesson.id ? true : false
  end

end
