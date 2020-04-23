# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: "admin@admin.pl", 
              password: "password",
              password_confirmation: "password",
              admin: true )

Size.create!(size: "XS")
Size.create!(size: "S")
Size.create!(size: "M")
Size.create!(size: "L")
Size.create!(size: "XL")

5.times do |i| 
  category = Category.new
  category.name = Faker::Commerce.unique.department(max: 1)
  category.save
end

15.times do |i| 
  product = Product.new
  product.title = Faker::Commerce.unique.product_name
  product.body = Faker::Lorem.paragraph_by_chars(number: 100)
  product.img.attach(io: open('https://picsum.photos/400/400'), filename: "#{i}image_url.jpg")
  product.price = Faker::Number.decimal(l_digits: 2) 
  product.category_id = Faker::Number.between(from: 1, to: 5)
  product.save
end
