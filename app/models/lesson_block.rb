class LessonBlock < ApplicationRecord
  belongs_to :lesson, optional: true
  belongs_to :block, polymorphic: true
  acts_as_list scope: :lesson
  default_scope { includes(:block) }
end