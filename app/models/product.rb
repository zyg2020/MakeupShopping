class Product < ApplicationRecord
  has_many :colors

  has_many :malls, through: :mall_products
  has_many :tags, through: :product_tags

  belongs_to :category
  belongs_to :type
  belongs_to :brand
end
