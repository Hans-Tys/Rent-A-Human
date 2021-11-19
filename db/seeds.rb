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
file = File.open((Rails.root.join('app', 'assets', 'images', 'tina.jpg')))
tina.photo.attach(io: file, filename: 'tina.jpg', content_type: 'image/jpg')
p tina
hans = User.create!(first_name: "hans", last_name: "tys", password: "123123", email: "hans@gmail.com")
file = File.open((Rails.root.join('app', 'assets', 'images', 'hans.jpg')))
hans.photo.attach(io: file, filename: 'hans.jpg', content_type: 'image/jpg')
p hans
layla = User.create!(first_name: "layla", last_name: "idk", password: "123123", email: "layla@gmail.com")
file = File.open((Rails.root.join('app', 'assets', 'images', 'layla.jpg')))
layla.photo.attach(io: file, filename: 'layla.jpg', content_type: 'image/jpg')
p layla
users = [tina, layla, hans]
activities = ["girlfriend", "boyfriend", "family", "prom date", "party", "wizard"]
50.times do
  persona = Persona.new(
    name: Faker::Movies::Hobbit.character,
    description: Faker::Movies::Hobbit.quote,
    location: Faker::Address.country,
    activity: activities.sample,
    user: users.sample
  )
  file = URI.open('https://source.unsplash.com/1600x900/?person')
  persona.photos.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')

  4.times do
    file = File.open((Rails.root.join('app', 'assets', 'images', 'placeholder.png')))
    persona.photos.attach(io: file, filename: 'placeholder.png', content_type: 'image/png')
  end
persona.save
p persona
end
