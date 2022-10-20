class LessonBlock < ApplicationRecord
  belongs_to :lesson_group, optional: true
  belongs_to :block, polymorphic: true, dependent: :destroy
  acts_as_list scope: :lesson_group
  default_scope { includes(:block) }
  
end