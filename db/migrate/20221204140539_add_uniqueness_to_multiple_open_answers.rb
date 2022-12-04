class AddUniquenessToMultipleOpenAnswers < ActiveRecord::Migration[7.0]
  def change
    add_index :multiple_open_answers, [:user_id, :multiple_open_piece_id], unique: true, name: 'index_mult_op_answers_on_user_and_mult_op_piece'
  end
end
