class Block < ApplicationRecord
  belongs_to :lesson, optional: true
  acts_as_list scope: :lesson
end