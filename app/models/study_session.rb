class StudySession < ApplicationRecord
  include ActionView::Helpers::DateHelper
  belongs_to :user
  belongs_to :lesson_group
  
  has_one :lesson, through: :lesson_group

  validates :user_id, presence: true, uniqueness: true
  validates :lesson_group_id, presence: true
  

  def session_ended?
    (self.time_left === 0) ? true : false
  end

  def time_left
    ((self.get_target_time - Time.now) < 0 ) ? 0 : distance_of_time_in_words(Time.now, self.get_target_time, include_seconds: true )
  end
  
  private

  # Default time is 1 hour if unset in lesson
  def get_target_time
    target_time = Lesson.select(:target_time).find(self.lesson.id).target_time
    target_time.nil? ? self.updated_at + 3600 : self.updated_at + target_time
  end


  
end
