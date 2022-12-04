class MultipleOpenAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :multiple_open_piece
  validates :user, presence: true, uniqueness: { scope: :multiple_open_piece, message: "User already answered this one" }

  def correct?
    self.answer.strip.downcase == self.multiple_open_piece.shown.strip.downcase
  end

  def full_answer
    answer_parts = self.multiple_open_piece.get_splitted_piece 
    answer_parts.first + self.answer + answer_parts.last
  end
end
