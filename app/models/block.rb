class Block < ApplicationRecord
  belongs_to :lesson, optional: true
  acts_as_list scope: :lesson
  has_many :rich_blocks, dependent: :nullify
end