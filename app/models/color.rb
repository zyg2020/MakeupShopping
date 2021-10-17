class Color < ApplicationRecord
  belongs_to :product

  validates :hex_value, presence: true
end
