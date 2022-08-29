class Product < ApplicationRecord
  validates :name, :price, presence: true
  has_many :lessons, dependent: :destroy

  def to_s
    name
  end
end
