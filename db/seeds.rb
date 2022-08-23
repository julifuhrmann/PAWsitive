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

puts "Create 30 users..."

puts "finished!"

30.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  user.save!
  puts "Creating #{User.count} - #{user.email}"
end

puts "Create 44 cat entries..."
i = 0
44.times do
  cat = Cat.new(
    name: Faker::Creature::Cat.name,
    age: rand(1..20),
    description: Faker::Creature::Cat.breed,
    user: User.all.sample
  )
  cat.photo.attach(io: URI.open(Cloudinary::Search.expression('folder=cats').execute["resources"][i]["url"]),
                    filename: Cloudinary::Search.expression('folder=cats').execute["resources"][i]["filename"],
                    content_type: "image/#{Cloudinary::Search.expression('folder=cats').execute["resources"][i]["format"]}")
  i += 1
  cat.save!
  puts "Creating #{cat.id} - #{cat.name}"
end

puts "Finished!"
