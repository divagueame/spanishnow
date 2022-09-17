class UserTextAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :user_text_block
  has_one :feedback, dependent: :destroy

  validates :user_id, presence: true, uniqueness: { scope: :user_text_block_id }
end
