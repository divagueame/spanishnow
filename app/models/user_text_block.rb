class UserTextBlock < ApplicationRecord
  has_one :lesson_block, as: :block, dependent: :destroy
  has_one :lesson, through: :lesson_block
  has_many :user_text_answers
  has_many :users, through: :user_text_answers

end
