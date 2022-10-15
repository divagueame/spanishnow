class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notifeable, polymorphic: true, dependent: :destroy
  before_create :add_user

  def add_user
    self.user_id = self.notifeable.user.id
  end

end
