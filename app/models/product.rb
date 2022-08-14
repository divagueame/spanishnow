class Product < ApplicationRecord
  validates :name, :price, presence: true
  has_many :lessons
  def to_s
    name
  end
end
