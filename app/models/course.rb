class Course < ApplicationRecord
  has_many :lessons, -> { order(position: :asc) }

  def active_lessons
    lessons.active
  end
end
