class AddSubheaderToRichBlock < ActiveRecord::Migration[7.0]
  def change
    add_column :rich_blocks, :subheader, :string
  end
end
