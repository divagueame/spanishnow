class UserTextBlock < ApplicationRecord
  has_one :lesson_block, as: :block, dependent: :destroy
  has_one :lesson, through: :lesson_block
  has_many :user_text_answers
  has_many :users, through: :user_text_answers
  after_save :create_user_text_answers

  private
  def create_user_text_answers
    p self
    p 'CHIKI!!'
  end
end
