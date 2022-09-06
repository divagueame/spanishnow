class UserTextBlock < ApplicationRecord
  belongs_to :user

  has_one :lesson_block, as: :block, dependent: :destroy
  has_one :lesson, through: :lesson_block

  validates :body, presence: true
end
