class CreateUserTextBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :user_text_blocks do |t|
      t.string :promptTitle
      t.text :promptBody
      t.integer :promptLength
      t.string :title
      t.text :body, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
