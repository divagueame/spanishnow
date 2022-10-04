class MultipleOpenBlock < ApplicationRecord
    
    has_many :multiple_open_pieces, dependent: :destroy
    has_many :multiple_open_answers, through: :multiple_open_pieces, dependent: :destroy
    accepts_nested_attributes_for :multiple_open_pieces,
        reject_if: lambda {|attributes| attributes['full'].blank? || attributes['shown'].blank? }

    has_one :lesson_block, as: :block, dependent: :destroy
    accepts_nested_attributes_for :lesson_block

    has_one :lesson, through: :lesson_block
end
