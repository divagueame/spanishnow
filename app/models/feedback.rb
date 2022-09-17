class Feedback < ApplicationRecord

  belongs_to :user_text_answer
  has_one :user, through: :user_text_answer

end