class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :user_text_answer
  
end
