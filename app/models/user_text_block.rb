class UserTextBlock < ApplicationRecord
  has_one :lesson_block, as: :block, dependent: :destroy
  has_one :lesson_group, through: :lesson_block
  has_many :user_text_answers, dependent: :destroy
  has_many :users, through: :user_text_answers

  accepts_nested_attributes_for :lesson_block

end
