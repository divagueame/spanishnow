class AddActiveToLessons < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons, :active, :boolean, default: false
  end
end
