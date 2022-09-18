class CreateMultipleOpenPieces < ActiveRecord::Migration[7.0]
  def change
    create_table :multiple_open_pieces do |t|
      t.string :full
      t.string :shown
      t.string :hint
      t.references :multiple_open_block, null: false, foreign_key: true

      t.timestamps
    end
  end
end
