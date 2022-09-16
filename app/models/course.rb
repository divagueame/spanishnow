class Course < ApplicationRecord
  has_many :lessons, -> { order(position: :asc) }
end
