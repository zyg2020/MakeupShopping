class Mall < ApplicationRecord
  has_many :products, through: :mall_products
end
