class LessonBlock < ApplicationRecord
  belongs_to :lesson_group, optional: true
  belongs_to :block, polymorphic: true, dependent: :destroy
  acts_as_list scope: :lesson_group
  default_scope { includes(:block) }

  def self.types
    ['rich_block', 'user_text_block', 'multiple_open_block']
  end
end