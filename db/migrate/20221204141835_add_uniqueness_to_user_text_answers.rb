class AddUniquenessToUserTextAnswers < ActiveRecord::Migration[7.0]
  def change
    add_index :user_text_answers, [:user_id, :user_text_block_id], unique: true
  end
end
