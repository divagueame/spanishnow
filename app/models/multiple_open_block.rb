class MultipleOpenBlock < ApplicationRecord
  has_one :lesson_block, as: :block, dependent: :destroy
  has_one :lesson_group, through: :lesson_block
  has_many :multiple_open_pieces, dependent: :destroy
  has_many :multiple_open_answers, through: :multiple_open_pieces, dependent: :destroy

  accepts_nested_attributes_for :lesson_block

  accepts_nested_attributes_for :multiple_open_pieces,
      reject_if: lambda {|attributes| attributes['full'].blank? || attributes['shown'].blank? }

  def answered?(user)
    self.multiple_open_answers.where(user_id: user.id).any?
  end

  def get_user_multiple_open_answers(user_id)
    self.multiple_open_answers.where(user_id: user_id)
  end
end
