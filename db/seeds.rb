require "net/http"
require "json"
require "pp"

require "csv"
require "faker"

Page.delete_all
Color.delete_all
ProductTag.delete_all
MallProduct.delete_all
Product.delete_all
Mall.delete_all
Brand.delete_all
Category.delete_all
Type.delete_all
Tag.delete_all

Faker::Name.unique.clear   # Clears used values for Faker::Name
Faker::UniqueGenerator.clear # Clears used values for all generator

filename = Rails.root.join("db/locations.csv")

puts "Loading locations from the csv file: #{filename}"

csv_data = File.read(filename)
locations = CSV.parse(csv_data, headers: true, encoding: "iso-8859-1")

(0..100).each do |i|
  # puts "Mall Name: #{Faker::Company.unique.name}"
  # puts locations[i]["city"]
  # puts locations[i]["lat"]
  # puts locations[i]["lng"]
  # puts "==============================================="

  mall = Mall.create(name: Faker::Company.unique.name,
                     city: locations[i]["city"],
                     lat:  locations[i]["lat"],
                     lng:  locations[i]["lng"])
  puts "Invalid mall!!!!!!!!!!!!!" if !mall || !mall.valid?
end
puts "first: #{Mall.first.id} - last: #{Mall.last.id}"
url = "http://makeup-api.herokuapp.com/api/v1/products.json"
uri = URI(url)
response = Net::HTTP.get(uri)
products = JSON.parse(response)

products.each do |p|
  brand = Brand.find_or_create_by(name: p["brand"])
  category = Category.find_or_create_by(name: p["category"])
  type = Type.find_or_create_by(name: p["product_type"])

  if brand && brand.valid? && category && category.valid? && type && type.valid?
    product = Product.new(name:         p["name"],
                          price:        p["price"],
                          image_link:   p["image_link"],
                          product_link: p["product_link"],
                          website_link: p["website_link"],
                          description:  p["description"],
                          rating:       p["rating"])
    product.brand = brand
    product.category = category
    product.type = type
    if product.save
      puts "Created a product record"
      tag_list = p["tag_list"]
      tag_list.each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name)
        ProductTag.create(product: product, tag: tag)
        puts "Created a ProductTag record"
      end

      random_numbers_malls = rand(1..10)
      random_numbers_malls.times do
        random_mall = Mall.find(rand(Mall.first.id..Mall.last.id))
        MallProduct.create(mall: random_mall, product: product)
        puts "Created a MallProduct record"
      end

    else
      puts "Invalid product #{p['name']}, id: #{p['id']}"
    end
  else
    puts "Invalid brand or Invalid category or Invalid type for #{p['name']}"
    puts "brand -> #{p['brand']}, category -> #{p['category']}, type -> #{product_type}"
    puts "===================================================================="
  end
end

Page.create(
  title:     "About the Data",
  content:   "The data powering this website was provided by an Makeup by Brand and Type API. Link of it: http://makeup-api.herokuapp.com/",
  permalink: "about_the_data"
)
Page.create(
  title:     "Contact Us",
  content:   "If you like this site and want to chat about the project or the data, email me at: zhuyange2018@gmail.com",
  permalink: "contact"
)

puts "Created #{Mall.count} Malls"
puts "Created #{MallProduct.count} MallProducts"
puts "Created #{Product.count} Products"
puts "Created #{Brand.count} Brands"
puts "Created #{Category.count} Categories"
puts "Created #{Type.count} Types"
puts "Created #{Color.count} Colors"
puts "Created #{ProductTag.count} ProductTags"
puts "Created #{Tag.count} Tags"
puts "Created #{Page.count} Pages"
