class MultipleOpenAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :multiple_open_piece

  def correct?
    self.answer.strip.downcase == self.multiple_open_piece.shown.strip.downcase
  end
end
