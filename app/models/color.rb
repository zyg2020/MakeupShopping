class Color < ApplicationRecord
  belongs_to :product

  validates :name, presence: true
  validates :hex_value, presence: true
end
