class CreateMultipleOpenAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :multiple_open_answers do |t|
      t.text :answer
      t.references :user, null: false, foreign_key: true
      t.references :multiple_open_piece, null: false, foreign_key: true

      t.timestamps
    end
  end
end
