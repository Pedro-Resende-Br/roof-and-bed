# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = []

5.times do
  user = User.new(
    email:    Faker::Internet.email,
    password: "abc123",
    role: "traveler"
  )
  user.save!
  users << user
end

10.times do
  flat = Flat.new(
    title:    Faker::Company.name,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    description: Faker::Lorem.sentences(number: 1),
    price: Faker::Number.decimal(l_digits: 2)
  )

  flat.user = users.sample

  flat.save!
end