class LessonBlock < ApplicationRecord
  belongs_to :lesson
  belongs_to :block, polymorphic: true
  acts_as_list scope: :lesson
  default_scope { includes(:block) }
end


# class Block < ApplicationRecord
#   belongs_to :lesson, optional: true
#   acts_as_list scope: :lesson
#   has_one :rich_block, dependent: :nullify
#   enum block_type: { rich_block: 0 }
  
#   validates :block_type_id, presence: true, uniqueness: { scope: :block_type }
# # private
# #   def self.types 
# #     ['rich_block']
# #   end
# end