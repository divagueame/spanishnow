class CreateLessonBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :lesson_blocks do |t|
      t.integer :position
      t.references :lesson, foreign_key: true
      t.references :block, polymorphic: true, null: false

      t.timestamps
    end
  end
end
