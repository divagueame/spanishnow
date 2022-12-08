class MultipleOpenPiece < ApplicationRecord
  belongs_to :multiple_open_block
  has_many :multiple_open_answers, dependent: :destroy
  
  def get_splitted_piece 
    self.full.split(self.shown, 2)
  end
end
