class Feedback < ApplicationRecord

  belongs_to :user_text_answer
  has_one :user, through: :user_text_answer
   
  # after_create_commit -> {
  #   broadcast_update_to "feedbacks_counter_#{self.user_text_answer.user_id}", 
  #   html: "joder man!!",
  #   # locals: { current_feedback_counter: self.user.unseen_feedbacks, user_id: self.user.id},'
  #   target: "feedbacks_counter"
  # }

end