# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'uri'
OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0

photo1 = URI.open('https://cdns-images.dzcdn.net/images/artist/09c8996e80653668ca912208911ddcd4/264x264.jpg')
photo2 = URI.open('https://cdn.britannica.com/s:575x450/84/154784-004-BD0C145B.jpg')
photo3 = URI.open('https://audio.mgtradio.net/storage/artists/bebel%20gilberto-1.jpg')
photo4 = URI.open('https://studiosol-a.akamaihd.net/letras/215x215/fotos/3/1/4/f/314f5fc559418f77dfd4cc594176843f.jpg')

puts 'creating users...'
users = []

user1 = User.new(
  email: Faker::Internet.email,
  password: "abc123",
  role: "traveler"
)
user1.avatar.attach(io: photo1, filename: 'thomas.jpg', content_type: 'image/jpg')
user1.save!

user2 = User.new(
  email: Faker::Internet.email,
  password: "abc123",
  role: "traveler"
)
user2.avatar.attach(io: photo2, filename: 'nina.jpg', content_type: 'image/jpg')
user2.save!

user3 = User.new(
  email: Faker::Internet.email,
  password: "abc123",
  role: "traveler"
)
user3.avatar.attach(io: photo3, filename: 'bebel.jpg', content_type: 'image/jpg')
user3.save!

user4 = User.new(
  email: Faker::Internet.email,
  password: "abc123",
  role: "traveler"
)
user4.avatar.attach(io: photo4, filename: 'bernhoft.jpg', content_type: 'image/jpg')
user4.save!

users << user1
users << user2
users << user3
users << user4

puts 'creating flats...'
titles = ["Private room in condominium", "Single Bed in 4-Bed Dorm", "Studio flat in the heart of Portobello Road", "Spacious Double Room in Nice House", "Single Bed in 8-Bed Dorm", "Amazing Studio - Great Area", "Cozy bedroom near central London", "Spacious Private Basement flat", "Single & Spacious Cosy Room", "Cozy room close to the center", "Master Double Bedroom in Rio", "Excellent quality accommodation nr Notting Hill"]

flats = []

10.times do
  flat_photo1 = URI.open('https://a0.muscache.com/im/pictures/0d7a10cd-1b6c-4eb8-b8c5-73826d3aed57.jpg')
  flat_photo2 = URI.open('https://a0.muscache.com/im/pictures/d222e5b9-8f51-4a72-8f3d-b2b2ef811c86.jpg')
  flat_photo3 = URI.open('https://a0.muscache.com/im/pictures/9c65a9fa-5836-4dbb-b138-e17e128ed42f.jpg')

  flat = Flat.new(
    title: titles.sample,
    address: "Hôtel de Ville, 75004 Paris, France",
    description: Faker::Lorem.paragraphs.first,
    price: Faker::Number.within(range: 40..200)
  )
  flat.user = users.sample
  flat.photos.attach(io: flat_photo2, filename: 'flat1.jpg', content_type: 'image/jpg')
  flat.photos.attach(io: flat_photo1, filename: 'flat1.jpg', content_type: 'image/jpg')
  flat.photos.attach(io: flat_photo3, filename: 'flat1.jpg', content_type: 'image/jpg')
  flat.save!
  flats << flat
end

puts 'creating bookings...'
4.times do
  booking = Booking.new(
    start_date: Faker::Date.between(from: '2021-05-20', to: '2021-05-25'),
    end_date: Faker::Date.between(from: '2021-06-01', to: '2021-06-21')
  )

  booking.user = users.sample
  booking.flat = flats.sample
  booking.save!
end
