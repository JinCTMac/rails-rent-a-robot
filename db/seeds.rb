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
User.destroy_all

puts "Database cleaned"

def attach_photo(user)
  url = "https://source.unsplash.com/random?sig=#{rand(1..60)}/&avatar/300x300"
  file = URI.open(url)
  user.photo.attach(io: file, filename: "#{user.first_name.gsub(" ", "-")}.jpeg", content_type: 'image/jpeg')
end

user_1 = User.create(email: "mary@gmail.com", password: "123456", first_name: "Mary", last_name: "Smith" )
attach_photo(user_1)

user_2 = User.create(email: "john@gmail.com", password: "123456", first_name: "John", last_name: "Smith" )
attach_photo(user_2)

user_3 = User.create(email: "andy@gmail.com", password: "123456", first_name: "Andy", last_name: "Smith" )
attach_photo(user_3)


USER_ARRAY = [user_1, user_2, user_3]
ROBOT_CATEGORIES = ['Gardening', 'Chef', 'Driver', 'Home', 'Nanny']

10.times do
  robot = Robot.create!(
    name: Faker::Name.first_name,
    category: ROBOT_CATEGORIES.sample,
    description: Faker::Quote.famous_last_words,
    price_per_day: rand(10..100),
    user: USER_ARRAY.sample
  )
  url = "https://source.unsplash.com/random?sig=#{rand(1..60)}/&robot/800x600"
  file = URI.open(url)
  robot.photo.attach(io: file, filename: "#{robot.name.gsub(" ", "-")}.jpeg", content_type: 'image/jpeg')
end


puts "#{Robot.count} Robots created"
