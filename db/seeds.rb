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


puts 'cleaning data base'
Booking.destroy_all
Flat.destroy_all
User.destroy_all

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
flats = []

#Flat 1

flat_photo1 = URI.open('https://a0.muscache.com/im/pictures/34a57ba2-c326-4055-a98b-bcdf588fc8d7.jpg')
flat_photo2 = URI.open('https://a0.muscache.com/im/pictures/eb2cf27d-19c6-4d80-86c7-08f56822ab6f.jpg')
flat_photo3 = URI.open('https://a0.muscache.com/im/pictures/cb737fa1-c07b-4419-b801-5b832233f5e7.jpg')

flat = Flat.new(
  title: "1 beadrom in Ile-de-France",
  address: "37-1 Passage du Ponceau, Paris, France",
  description: "Lovely flat located in the heart of paris, walking distance form the Seine river",
  price: Faker::Number.within(range: 40..200)
)
flat.user = users.sample
flat.photos.attach(io: flat_photo2, filename: 'flat2.jpg', content_type: 'image/jpg')
flat.photos.attach(io: flat_photo1, filename: 'flat1.jpg', content_type: 'image/jpg')
flat.photos.attach(io: flat_photo3, filename: 'flat3.jpg', content_type: 'image/jpg')
flat.save!
flats << flat

# #Flat 2

flat_photo1 = URI.open('https://a0.muscache.com/im/pictures/prohost-api/Hosting-49271125/original/5f1ea053-1373-46bf-a589-c38db9d6c593.jpeg')
flat_photo2 = URI.open('https://a0.muscache.com/im/pictures/prohost-api/Hosting-49271125/original/07c388ae-0a8a-43dc-8416-3eea563ae27b.jpeg')
flat_photo3 = URI.open('https://a0.muscache.com/im/pictures/prohost-api/Hosting-49271125/original/82eb4ed2-fe59-413d-8358-532a7ead4e97.jpeg')

flat = Flat.new(
  title: "Apartment in front of the beach",
  address: "Av. Vieira Souto, 366, Ipanema, Rio de Janeiro, Brazil",
  description: "Big apartment with panoramic view for the best urban beach in ther world. Come to have an unique experince",
  price: Faker::Number.within(range: 40..200)
)
flat.user = users.sample
flat.photos.attach(io: flat_photo2, filename: 'flat2.jpg', content_type: 'image/jpg')
flat.photos.attach(io: flat_photo1, filename: 'flat1.jpg', content_type: 'image/jpg')
flat.photos.attach(io: flat_photo3, filename: 'flat3.jpg', content_type: 'image/jpg')
flat.save!
flats << flat

#Flat 3

flat_photo1 = URI.open('https://a0.muscache.com/im/pictures/f1463fb8-0252-4c2e-8d0b-35d775be0c1f.jpg')
flat_photo2 = URI.open('https://a0.muscache.com/im/pictures/39f9886a-72a4-459d-aa7f-d0c37757526b.jpg')
flat_photo3 = URI.open('https://a0.muscache.com/im/pictures/0fcd6a69-0c0c-4ea4-b2c1-c309bb62a63b.jpg')

flat = Flat.new(
  title: "Penthouse in Copacabana",
  address: "Rodolfo Dantas 85, Rio de Janeiro, Brazil",
  description: "Modern and spacious 2 bedroom penthouse ideally located in Copacabana. This penthouse provides the perfect private retreat in which to relax yourself: stylish interior design, bright rooms and a large terrace with a swimming-pool.",
  price: Faker::Number.within(range: 40..200)
)
flat.user = users.sample
flat.photos.attach(io: flat_photo2, filename: 'flat2.jpg', content_type: 'image/jpg')
flat.photos.attach(io: flat_photo1, filename: 'flat1.jpg', content_type: 'image/jpg')
flat.photos.attach(io: flat_photo3, filename: 'flat3.jpg', content_type: 'image/jpg')
flat.save!
flats << flat


#Flat 4

flat_photo1 = URI.open('https://a0.muscache.com/im/pictures/43e646f6-5d67-474b-aa7a-b272659d8146.jpg')
flat_photo2 = URI.open('https://a0.muscache.com/im/pictures/e2dcfeb8-33e5-4b12-828c-02df8d2d1f7e.jpg')
flat_photo3 = URI.open('https://a0.muscache.com/im/pictures/680315aa-90cc-4e7c-9ba0-4070610a46d4.jpg')

flat = Flat.new(
  title: "The Sugar Loaf in your window",
  address: "Avenida Oswaldo cruz 73, Flamengo, Rio de Janeiro, Brazil",
  description: "Apartment with beautiful view of the Sugar Loaf Mountain and Guanabara Bay. Airy and modern, decorated with refinement and good taste by a renowned Brazilian architect. Luxury standard for demanding and refined guests. Located in front of the beautiful Flamengo Park, reaching by foot the neighborhood beach and 10 minutes by car or public transportation (bus/subway) from Leme and Copacabana beach. Secure parking lot, 24 hours, at the gas station down the street from the building.",
  price: Faker::Number.within(range: 40..200)
)
flat.user = users.sample
flat.photos.attach(io: flat_photo2, filename: 'flat2.jpg', content_type: 'image/jpg')
flat.photos.attach(io: flat_photo1, filename: 'flat1.jpg', content_type: 'image/jpg')
flat.photos.attach(io: flat_photo3, filename: 'flat3.jpg', content_type: 'image/jpg')
flat.save!
flats << flat




#Flat 5

flat_photo1 = URI.open('https://a0.muscache.com/im/pictures/d4a09624-55f9-423b-aa06-be498cda7955.jpg')
flat_photo2 = URI.open('https://a0.muscache.com/im/pictures/50b5fc2d-3fcf-446e-acd3-7c2a37b2f205.jpg')
flat_photo3 = URI.open('https://a0.muscache.com/im/pictures/d6ee1dd4-003f-4b9f-9f5e-5f6673667fb5.jpg')

flat = Flat.new(
  title: "Notre Dame Penthouse",
  address: "72 Quai de la Tournelle, Paris, France",
  description: "My place is close to Shakespeare & Company, Île Saint-Louis, Berthillon, Notre Dame, Latin Quarter, St Michele. You’ll love my place because of the kitchen, the coziness, the location, and the views. My place is good for couples, solo adventurers, business travelers, families (with kids), and big groups.",
  price: Faker::Number.within(range: 40..200)
)
flat.user = users.sample
flat.photos.attach(io: flat_photo2, filename: 'flat2.jpg', content_type: 'image/jpg')
flat.photos.attach(io: flat_photo1, filename: 'flat1.jpg', content_type: 'image/jpg')
flat.photos.attach(io: flat_photo3, filename: 'flat3.jpg', content_type: 'image/jpg')
flat.save!
flats << flat



#Flat 6

flat_photo1 = URI.open('https://a0.muscache.com/im/pictures/60135a2f-1318-4467-9e41-3c753e708fc6.jpg')
flat_photo2 = URI.open('https://a0.muscache.com/im/pictures/8ac1b95b-fb6f-4137-a597-754cdb120e83.jpg')
flat_photo3 = URI.open('https://a0.muscache.com/im/pictures/c07dd8e4-6198-46d4-a86f-6652f48366dc.jpg')

flat = Flat.new(
  title: "Luxury Apartment - Louvre",
  address: "16 Quai de Gesvres, Paris, France",
  description: "The health & safety of our guests are our primary concern. Our Anti-Covid cleaning ensures the strict implementation of sanitation practices.You are living in the heart of Paris! Located on the third floor of a building dating from 1860,the apartment will surprise you lit by the light of day that makes the apartment cosy.The living room is a warm room, carefully decorated always in the unique spirit of the Parisian style. From the entrance of the apartment to the bathroom, the mix of precious materials and furniture together convey a harmonious elegance.",
  price: Faker::Number.within(range: 40..200)
)
flat.user = users.sample
flat.photos.attach(io: flat_photo2, filename: 'flat2.jpg', content_type: 'image/jpg')
flat.photos.attach(io: flat_photo1, filename: 'flat1.jpg', content_type: 'image/jpg')
flat.photos.attach(io: flat_photo3, filename: 'flat3.jpg', content_type: 'image/jpg')
flat.save!
flats << flat



#Flat 7

flat_photo1 = URI.open('https://a0.muscache.com/im/pictures/20c21298-8f81-4cd4-a3fc-a0f18148c1f5.jpg')
flat_photo2 = URI.open('https://a0.muscache.com/im/pictures/45888fbe-726b-474a-9f6d-ef3b2966653b.jpg')
flat_photo3 = URI.open('https://a0.muscache.com/im/pictures/ffa5e8a9-db22-48b0-9234-fa3bd9a6fb5a.jpg')

flat = Flat.new(
  title: "Modern apartment in the center",
  address: "Budapest, István u. 3, 1078 Hungria",
  description: "This is a super central, nicely renovated apartment with a gallery (loft). Ideal for a couple or a family of 4 people. Located in the vivid and popular 7th (Jewish) district, close to many sites, near the beautiful New York Cafe. The area offers a great choice of restaurants, bars and cafes. Supermarkets, shops are in walking distance. There are lots of public transportation options nearby, but you won't need them too much anyway.",
  price: Faker::Number.within(range: 40..200)
)
flat.user = users.sample
flat.photos.attach(io: flat_photo2, filename: 'flat2.jpg', content_type: 'image/jpg')
flat.photos.attach(io: flat_photo1, filename: 'flat1.jpg', content_type: 'image/jpg')
flat.photos.attach(io: flat_photo3, filename: 'flat3.jpg', content_type: 'image/jpg')
flat.save!
flats << flat

# Flat 8

flat_photo1 = URI.open('https://a0.muscache.com/im/pictures/6a16b806-3ff2-4a47-b429-ee893c4f013d.jpg')
flat_photo2 = URI.open('https://a0.muscache.com/im/pictures/10c71366-fce0-4690-9d7b-630c63a73a56.jpg')
flat_photo3 = URI.open('https://a0.muscache.com/im/pictures/d70c318c-2006-40cb-9eef-e7f4b0d70c1f.jpg')

flat = Flat.new(
  title: "Center of Shibuya!",
  address: "Fujiyoshida, Yamanashi 403-0004",
  description: "A clean, beautiful apartment with almost everything you need! The house has a PARKING, 2 bedrooms and kitchen/bathroom, toilet with washlet. It's located near Shibuya station which is the center of Tokyo!!! on JR Yamanote line, so easy to go to everywhere",
  price: Faker::Number.within(range: 40..200)
)
flat.user = users.sample
flat.photos.attach(io: flat_photo2, filename: 'flat2.jpg', content_type: 'image/jpg')
flat.photos.attach(io: flat_photo1, filename: 'flat1.jpg', content_type: 'image/jpg')
flat.photos.attach(io: flat_photo3, filename: 'flat3.jpg', content_type: 'image/jpg')
flat.save!
flats << flat

#Flat 9

flat_photo1 = URI.open('https://a0.muscache.com/im/pictures/9c9da3cf-3463-48ae-9544-6e4f91c8db6b.jpg')
flat_photo2 = URI.open('https://a0.muscache.com/im/pictures/375145a6-a360-4db6-89d6-dde8b69b9593.jpg')
flat_photo3 = URI.open('https://a0.muscache.com/im/pictures/b7586890-ec1e-4e66-8eb2-6d415cce8312.jpg')

flat = Flat.new(
  title: "Aspen best choice!",
  address: "150 E Durant Ave, Aspen",
  description: "We rent only to responsible guests who want the best of Aspen in a quiet, quality environment. Accordingly, we do ask our guests to provide a description of themselves and their party in terms of profession and backgrounds.",
  price: Faker::Number.within(range: 40..200)
)
flat.user = users.sample
flat.photos.attach(io: flat_photo2, filename: 'flat2.jpg', content_type: 'image/jpg')
flat.photos.attach(io: flat_photo1, filename: 'flat1.jpg', content_type: 'image/jpg')
flat.photos.attach(io: flat_photo3, filename: 'flat3.jpg', content_type: 'image/jpg')
flat.save!
flats << flat

#Flat 10

flat_photo1 = URI.open('https://a0.muscache.com/im/pictures/6da579fd-c4ee-475b-8cee-b6d3e33fa7e6.jpg')
flat_photo2 = URI.open('https://a0.muscache.com/im/pictures/0322ecf0-1ec0-442d-a52c-ba516f4fc2d4.jpg')
flat_photo3 = URI.open('https://a0.muscache.com/im/pictures/fc35dddc-f1ab-4b4b-9d3f-865d9146dd82.jpg')

flat = Flat.new(
  title: "Gite du Grand Delmas",
  address: "1213 Chemin de la Tite",
  description: "A 50 km de Valence, le village de Bourdeaux, entre Provence et Vercors, offre une vue à couper le souffle sur la chaîne de Couspeau. Le gîte du Grand Delmas, blotti contre la colline est parfait pour un séjour au cœur de la nature.",
  price: Faker::Number.within(range: 40..200)
)
flat.user = users.sample
flat.photos.attach(io: flat_photo2, filename: 'flat2.jpg', content_type: 'image/jpg')
flat.photos.attach(io: flat_photo1, filename: 'flat1.jpg', content_type: 'image/jpg')
flat.photos.attach(io: flat_photo3, filename: 'flat3.jpg', content_type: 'image/jpg')
flat.save!
flats << flat


# 10.times do
#   flat_photo1 = URI.open('https://a0.muscache.com/im/pictures/0d7a10cd-1b6c-4eb8-b8c5-73826d3aed57.jpg')
#   flat_photo2 = URI.open('https://a0.muscache.com/im/pictures/d222e5b9-8f51-4a72-8f3d-b2b2ef811c86.jpg')
#   flat_photo3 = URI.open('https://a0.muscache.com/im/pictures/9c65a9fa-5836-4dbb-b138-e17e128ed42f.jpg')

#   flat = Flat.new(
#     title: titles.sample,
#     address: "Hôtel de Ville, 75004 Paris, France",
#     description: Faker::Lorem.paragraphs.first,
#     price: Faker::Number.within(range: 40..200)
#   )
#   flat.user = users.sample
#   flat.photos.attach(io: flat_photo2, filename: 'flat1.jpg', content_type: 'image/jpg')
#   flat.photos.attach(io: flat_photo1, filename: 'flat1.jpg', content_type: 'image/jpg')
#   flat.photos.attach(io: flat_photo3, filename: 'flat1.jpg', content_type: 'image/jpg')
#   flat.save!
#   flats << flat
# end

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
