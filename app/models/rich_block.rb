class RichBlock < ApplicationRecord
    has_rich_text :content
    belongs_to :block, optional: true
end