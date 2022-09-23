class StudySession < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :user_id, presence: true, uniqueness: true
  validates :lesson_id, presence: true
  

  def session_ended?
    (Time.now.utc > self.get_target_time) ? true : false
  end

  private

  # Default time is 1 hour if unset in lesson
  def get_target_time
    target_time = Lesson.select(:target_time).find(self.lesson_id).target_time
    target_time.nil? ? self.updated_at + 3600 : self.updated_at + target_time
  end
  
end
