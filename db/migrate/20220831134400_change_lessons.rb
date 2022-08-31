class ChangeLessons < ActiveRecord::Migration[7.0]
  def change
    change_column_null :lessons, :product_id, true
    change_column_null :blocks, :lesson_id, true
  end
end
