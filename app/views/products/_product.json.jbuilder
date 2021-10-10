json.extract! product, :id, :name, :price, :image_link, :product_link, :website_link, :description, :rating, :category_id, :type_id, :created_at, :updated_at
json.url product_url(product, format: :json)
