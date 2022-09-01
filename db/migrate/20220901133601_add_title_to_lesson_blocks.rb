class AddTitleToLessonBlocks < ActiveRecord::Migration[7.0]
  def change
    add_column :lesson_blocks, :title, :string
  end
end
