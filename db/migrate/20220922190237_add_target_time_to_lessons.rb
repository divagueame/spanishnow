class AddTargetTimeToLessons < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons, :target_time, :integer
  end
end
