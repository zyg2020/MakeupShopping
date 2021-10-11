require "open-uri"
require "net/http"

class Product < ApplicationRecord
  has_many :colors

  has_many :mall_products
  has_many :malls, through: :mall_products

  has_many :product_tags
  has_many :tags, through: :product_tags

  belongs_to :category
  belongs_to :type
  belongs_to :brand

  def self.remote_file_exists?(url)
    url = URI.parse(url)
    Net::HTTP.start(url.host, url.port) do |http|
      return http.head(url.request_uri)["Content-Type"].start_with? "image"
    end
  end
end
