class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.text :body
      t.boolean :seen
      t.references :user_text_answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
