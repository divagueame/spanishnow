class UserTextAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :user_text_block
end
