# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating new garages"

Garage.destroy_all

user = User.first

g = Garage.create!(user: user, capacity: 10, price: 50, location: "01 rue kleber 59100 Marcq", description: "Magnifique Garage plein sud")
g.remote_photo_url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
g.save!
g = Garage.create!(user: user, capacity: 6, price: 30, location: "18 rue mouscron 59170 Lille", description: "Magnifique Garage plein sud")
g.remote_photo_url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
g.save!
g = Garage.create!(user: user, capacity: 7, price: 30, location: "99 rue kleber 45876 Croix", description: "Magnifique Garage plein sud")
g.remote_photo_url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
g.save!
g = Garage.create!(user: user, capacity: 6, price: 10, location: "98 rue kleber 09876 Lomme", description: "Magnifique Garage plein sud")
g.remote_photo_url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
g.save!
g = Garage.create!(user: user, capacity: 10, price: 100, location: "28 rue kleber 65432 Nice", description: "Magnifique Garage plein sud")
g.remote_photo_url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
g.save!
g = Garage.create!(user: user, capacity: 12, price: 20, location: "108 rue kleber 59170 Canne", description: "Magnifique Garage plein sud")
g.remote_photo_url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
g.save!
g = Garage.create!(user: user, capacity: 8, price: 30, location: "3248 rue kleber 75000 Paris", description: "Magnifique Garage plein sud")
g.remote_photo_url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
g.save!

puts "finished"


puts "Creating new users"

User.create!(email: 'delphine@gmail.com', password: 'azerty', first_name: 'Delphine', last_name: 'Cordonnier', phone_number: '0677333977')
User.create!(email: 'remi@gmail.com', password: 'azerty', first_name: 'antoine', last_name: 'sorlin', phone_number: '0677889977')
User.create!(email: 'antoine@gmail.com', password: 'azerty', first_name: 'Remi', last_name: 'Cordonnier', phone_number: '067711977')
User.create!(email: 'martin@hotmail.com', password: 'azerty', first_name: 'Martin', last_name: 'Cordonnier', phone_number: '06723388977')
User.create!(email: 'alex56@gmail.com', password: 'azerty', first_name: 'bouba', last_name: 'pfrt', phone_number: '0677889977')
User.create!(email: 'duroyon@gmail.fr', password: 'azerty', first_name: 'Delphine', last_name: 'Cordonnier', phone_number: '0677889977')
User.create!(email: 'Henripfr@gmail.com', password: 'azerty', first_name: 'Delphine', last_name: 'derujh', phone_number: '067788227')
User.create!(email: 'Bouba@gmail.com', password: 'azerty', first_name: 'bouba', last_name: 'arlou', phone_number: '0677889977')
User.create!(email: 'Sadju@gmail.com', password: 'azerty', first_name: 'Daju', last_name: 'Massoni', phone_number: '0611189977')

puts "Finised"
