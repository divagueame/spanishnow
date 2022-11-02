class StudySession < ApplicationRecord
  include ActionView::Helpers::DateHelper
  belongs_to :user
  belongs_to :lesson_group

  has_one :lesson, through: :lesson_group

  validates :user_id, presence: true, uniqueness: true
  validates :lesson_group_id, presence: true

  def session_ended?
    time_left === 0
  end

  def time_left
    if (get_target_time - Time.now) < 0
      0
    else
      distance_of_time_in_words(Time.now, get_target_time,
                                include_seconds: true)
    end
  end

  def update_next_group
    if !(self.lesson_group.last?)
      # p self.lesson_group.lower_item
      self.update(lesson_group_id: self.lesson_group.lower_item.id)
    else
      p 'NOT!'
      # p self.lesson_group.lower_item

    end
  end

  private

  # Default time is 1 hour if unset in lesson
  def get_target_time
    target_time = Lesson.select(:target_time).find(lesson.id).target_time
    target_time.nil? ? updated_at + 3600 : updated_at + target_time
  end
end
