# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'cleaning database'
Rental.destroy_all
Bike.destroy_all
User.destroy_all


cities_names = ["Berlin", "Rome", "London","Paris"]

cities_locations = {
  "Berlin" => [
    "Genslerstraße 84, Berlin",
    "Brandenburgische Straße 89, Berlin",
    "Leopoldstraße 51, Berlin"
  ],
  "Rome" => [
    "VIALE EUROPA 22, Rome",
    "VIA APPIA NUOVA 123, Rome",
    "Via Francesco Saverio Nitti, 28, Rome"
  ],
  "Paris" => [
    "3 rue de la paix, Paris",
    "31 rue de rivoli, Paris",
    "8 rue du louvre, Paris"
  ],
  "London" => [
    "10 downing street, London",
    "15 approach road, London",
    "18 oxford street, London"
  ]
}
bike_location = cities_locations[cities_names.sample].sample

puts 'Creating 10 fake users...'
30.times do
  user = User.new({
    name: Faker::FamilyGuy.character,
    email: Faker::Internet.email,
    password: Faker::Vehicle.vin
    })
  user.save!

  bike = Bike.new({
    name: Faker::Vehicle.manufacture,
    price: Faker::Number.decimal(2),
    location: bike_location
    })
  bike.seller = user
  bike.save!
end

# puts 'Creating 50 fake bikes...'
# 50.times do
#   bike = Bike.new({
#     name: Faker::Vehicle.manufacture,
#     })
#   bike.save!
# end

# puts 'Creating 20 fake rentals...'
# 20.times do
#   rental = Rental.new({
#     name: Faker::Book.publisher
#     })
#   rental.save!
# end

puts 'Finished!'
