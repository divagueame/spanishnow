class Lesson < ApplicationRecord
  belongs_to :product, optional: true
  has_many :lesson_groups, -> { order(position: :asc) }, dependent: :nullify
  has_one_attached :image, :dependent => :destroy

  belongs_to :course, optional: true
  acts_as_list scope: :course
  scope :active,  -> {
    where(:active => true)
  }
  def this_lesson_study_session?(study_session)
    self.id === study_session.lesson.id ? true : false
  end

  def lower_active_item
    self.lower_items.where(active: true).first
  end
end
