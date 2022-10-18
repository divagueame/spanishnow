class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notifeable, polymorphic: true, dependent: :destroy
  before_create :add_user

  def add_user
    self.user_id = self.notifeable.user.id
  end

  def partial_path
    if self.notifeable_type === 'Feedback'
      return 'notifications/feedback_content'
    end
  end
end
