class CreateUserTextAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :user_text_answers do |t|
      t.string :title
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    remove_column :user_text_blocks, :body
    remove_column :user_text_blocks, :title
    remove_column :user_text_blocks, :user_id
  end
end
