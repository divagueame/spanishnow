class AddLessonGroupIdToLessonBlock < ActiveRecord::Migration[7.0]
  def change
    add_reference :lesson_blocks, :lesson_group, foreign_key: true
  end
end
