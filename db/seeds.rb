ShippingType.create name: "Paczka Pocztowa", cost: 10.0
ShippingType.create name: "Kurier", cost: 20.0


8.times do
  Category.create! name: Faker::Hacker.ingverb.capitalize
end

category_ids = Category.pluck(:id)

print "Product "
200.times do
  product = Product.create! name: "#{Faker::Hacker.verb} #{Faker::Hacker.noun}".capitalize,
    description: Faker::Hacker.say_something_smart,
    long_description: Faker::Lorem.paragraphs.join("\n\n"),
    category_id: category_ids.sample,
    price: Faker::Number.decimal
  product.remote_photo_url = Faker::Avatar.image(
    product.name.parameterize,
    "640x480",
    "jpg",
    "set#{[1, 2, 3].sample}",
    "bg#{[1, 2].sample}"
  )
  product.save
  print "."
end
puts
