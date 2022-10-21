class AddActiveToLessonGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :lesson_groups, :active, :boolean, default: true
  end
end
