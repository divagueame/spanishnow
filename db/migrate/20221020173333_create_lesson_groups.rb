class CreateLessonGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :lesson_groups do |t|
      t.string :title
      t.text :description
      t.integer :position
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
