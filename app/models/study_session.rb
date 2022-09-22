class StudySession < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  before_validation :set_start

  validates :user_id, presence: true, uniqueness: true
  validates :start, presence: true
  validates :lesson_id, presence: true


  def set_start
    # self.start = Time.now
  end

  def get_target_time
    target_time = Lesson.select(:target_time).find(self.lesson_id).target_time
    p 'START SELF!'
    p target_time
    target_time.nil? ? 3600 : target_time
  end

  def session_ended?
    target_time = get_target_time
    p target_time
    if Time.now < target_time
      false
    else
      true
    end

  end
end
