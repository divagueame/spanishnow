class MultipleOpenBlock < ApplicationRecord
    has_many :multiple_open_pieces, dependent: :destroy
    has_one :lesson, through: :lesson_block
    has_one :lesson_block, as: :block, dependent: :destroy
end
