class CreateRichBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :rich_blocks do |t|

      t.timestamps
    end
  end
end
