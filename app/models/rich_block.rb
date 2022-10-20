class RichBlock < ApplicationRecord
    has_rich_text :content

    has_one :lesson_block, as: :block, dependent: :destroy
    has_one :lesson_group, through: :lesson_block

    accepts_nested_attributes_for :lesson_block
end