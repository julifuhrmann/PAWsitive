# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "reset db..."
Cat.destroy_all
User.destroy_all

puts "Create 50 users..."

50.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  user.save!
  puts "Creating #{User.count} - #{User.name}"
end

puts "Create 100 cat entries..."

10.times do
  cat = Cat.new(
    name: Faker::Creature::Cat.name,
    age: rand(1..20),
    description: Faker::Creature::Cat.breed,
    user: User.all.sample
  )
  cat.save
  puts "Creating #{cat.id} - #{cat.name}"
end

puts "Finished!"
