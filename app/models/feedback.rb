class Feedback < ApplicationRecord
include ActionView::RecordIdentifier

  belongs_to :user_text_answer
  has_one :user, through: :user_text_answer
   
  after_create_commit -> {
    broadcast_update_to dom_id(self.user, 'unseen_feedback'),
    partial: "feedbacks/unseen_feedbacks_count",
    target: "unseen_feedback",
    locals: {user: self.user}
  }
end