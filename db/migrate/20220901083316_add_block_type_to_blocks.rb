class AddBlockTypeToBlocks < ActiveRecord::Migration[7.0]
  def change
    # add_column :blocks, :block_type, :integer, default: 0
    # add_column :blocks, :block_type_id, integer
    # add_reference :blocks, :block_, polymorphic: true, index: true
  end
end
