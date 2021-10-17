class Mall < ApplicationRecord
  has_many :mall_products
  has_many :products, through: :mall_products

  validates :name, presence: true
  validates :name, uniqueness: true
end
