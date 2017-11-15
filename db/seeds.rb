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

puts 'Creating 10 fake users...'
10.times do
  user = User.new({
    name: Faker::FamilyGuy.character,
    email: Faker::Internet.email,
    password: Faker::Vehicle.vin
    })
  user.save!
  bike = Bike.new({
    name: Faker::Vehicle.manufacture,
    price: Faker::Number.decimal(2),
    location: ["Paris", "Amsterdam", "Berlin", "London", "Rome"].sample
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
