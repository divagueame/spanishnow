class AddLessonGroupToStudySession < ActiveRecord::Migration[7.0]
  def change
    add_reference :study_sessions, :lesson_group, null: false, foreign_key: true
    remove_reference :study_sessions, :lesson, null: false, foreign_key: true
  end
end
