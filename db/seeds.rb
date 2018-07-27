# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Khanh Hung",
  email: "hungnk1995@gmail.com",
  phone_number: "0989115274",
  password: "123456",
  password_confirmation: "123456",
  is_admin: true)

20.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@fake.com"
  password = "password"
  phone_number = Faker::PhoneNumber.phone_number
  User.create!(name: name,
    email: email,
    phone_number: phone_number,
    password: password,
    password_confirmation: password)
end
