class MultipleOpenAnswer < ApplicationRecord
  belongs_to :multiple_open_piece
  belongs_to :user

  validates :user_id, presence: true, uniqueness: { scope: :multiple_open_piece_id }
end
