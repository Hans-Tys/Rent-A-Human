# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

Review.destroy_all
Booking.destroy_all
Persona.destroy_all
User.destroy_all

tina = User.create!(first_name: "tina", last_name: "gouws", password: "123123", email: "tina@gmail.com")
file = URI.open('https://picsum.photos/200/300')
tina.photo.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')

layla = User.create!(first_name: "layle", last_name: "idk", password: "123123", email: "layle@gmail.com")
file = URI.open('https://picsum.photos/200/300')
layla.photo.attach(io: file, filename: 'nes.jpg', content_type: 'image/jgp')

hans = User.create!(first_name: "hans", last_name: "tys", password: "123123", email: "hans@gmail.com")
file = URI.open('https://picsum.photos/200/300')
hans.photo.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')

users = [tina, layla, hans]
activities = ["girlfriend", "boyfriend", "family", "prom date", "party", "wizard"]
50.times do
  persona = Persona.new(
    name: Faker::Movies::Hobbit.character,
    description: Faker::Movies::Hobbit.quote,
    location: Faker::Address.city,
    activity: activities.sample,
    user: users.sample
  )
  file = URI.open('  https://source.unsplash.com/1600x900/?person')
  persona.photos.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')

  4.times do
    file = URI.open('https://picsum.photos/200/300')
    persona.photos.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')
  end
  persona.save!
  p persona
end
