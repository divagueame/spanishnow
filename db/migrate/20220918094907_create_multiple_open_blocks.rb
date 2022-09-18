class CreateMultipleOpenBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :multiple_open_blocks do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
