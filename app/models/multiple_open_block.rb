class MultipleOpenBlock < ApplicationRecord
    has_one :lesson_block, as: :block, dependent: :destroy
    has_one :lesson_group, through: :lesson_block
    has_many :multiple_open_pieces, dependent: :destroy
    
    accepts_nested_attributes_for :lesson_block

    # accepts_nested_attributes_for :multiple_open_pieces,
    #     reject_if: lambda {|attributes| attributes['full'].blank? || attributes['shown'].blank? }


        
    
end
