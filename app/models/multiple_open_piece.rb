class MultipleOpenPiece < ApplicationRecord
  belongs_to :multiple_open_block
  has_many :multiple_open_answers, dependent: :destroy
  
  def get_hidden_field
   ['hidden filed','after field']
  end
end
