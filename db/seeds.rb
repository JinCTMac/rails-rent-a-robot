# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning up database..."

Booking.destroy_all
Robot.destroy_all

puts "Database cleaned"

User.create(email: "bob@gmail.com", password: "123456")

10.times do
  robot = Robot.create!(
    name: Faker::Name.first_name,
    category: Faker::Job.field,
    description: Faker::Job.seniority,
    price_per_day: rand(10..100),
    user: User.first
  )
  url = "https://source.unsplash.com/random?sig=#{rand(1..60)}/&robot/800x600"
  file = URI.open(url)
  robot.photo.attach(io: file, filename: "#{robot.name.gsub(" ", "-")}.jpeg", content_type: 'image/jpeg')
end

puts "#{Robot.count} Robots created"
