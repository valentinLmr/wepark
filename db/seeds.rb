# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating new users"

User.destroy_all

User.create!(email: 'delphine@gmail.com', password: 'azerty', first_name: 'Delphine', last_name: 'Cordonnier', phone_number: '0677333977')
User.create!(email: 'remi59@gmail.com', password: 'azerty', first_name: 'antoine', last_name: 'sorlin', phone_number: '0677889977')
User.create!(email: 'antoine@gmail.com', password: 'azerty', first_name: 'Remi', last_name: 'Cordonnier', phone_number: '067711977')
User.create!(email: 'martin@hotmail.com', password: 'azerty', first_name: 'Martin', last_name: 'Cordonnier', phone_number: '06723388977')
User.create!(email: 'alex56@gmail.com', password: 'azerty', first_name: 'bouba', last_name: 'pfrt', phone_number: '0677889977')
User.create!(email: 'duroyon@gmail.fr', password: 'azerty', first_name: 'Delphine', last_name: 'Cordonnier', phone_number: '0677889977')
User.create!(email: 'Henripfr@gmail.com', password: 'azerty', first_name: 'Delphine', last_name: 'derujh', phone_number: '067788227')
User.create!(email: 'Bouba@gmail.com', password: 'azerty', first_name: 'bouba', last_name: 'arlou', phone_number: '0677889977')
User.create!(email: 'Sadju@gmail.com', password: 'azerty', first_name: 'Daju', last_name: 'Massoni', phone_number: '0611189977')

puts "Finised"

puts "Creating new garages"

Garage.destroy_all

first_user = User.first
last_user = User.last

g = Garage.create!(user: first_user, capacity: 10, price: 50, location: "01 rue kleber 59100 Marcq", description: "Grand Garage")
g.remote_photo_url = "https://media.gettyimages.com/photos/garage-picture-id528098460?s=612x612"
g.save!
g = Garage.create!(user: first_user, capacity: 6, price: 30, location: "18 rue mouscron 59170 Lille", description: "Magnifique Garage éclairé avec fenetere")
g.remote_photo_url = "https://www.degarageamersfoort.nl/userfiles/images/mbo_garage_bg_1.jpg"
g.save!
g = Garage.create!(user: last_user, capacity: 7, price: 30, location: "99 rue kleber 45876 Croix", description: "Petit Garage plein nord")
g.remote_photo_url = "https://www.ctm-renovation.fr/wp-content/uploads/2016/04/construire-un-garage.jpg"
g.save!
g = Garage.create!(user: last_user, capacity: 6, price: 10, location: "98 rue kleber 09876 Lomme", description: "Magnifique Garage plein sud")
g.remote_photo_url = "https://www.steeltechsheds.ie/wp-content/gallery/garages-2017/26ft-x-17ft-garage.jpg"
g.save!
g = Garage.create!(user: first_user, capacity: 10, price: 100, location: "28 rue kleber 65432 Nice", description: "Nouveau Garage en brique rouge")
g.remote_photo_url = "https://www.sgauto-16.fr/userfiles/7066/garage-SG-Auto.jpg"
g.save!
g = Garage.create!(user: last_user, capacity: 12, price: 20, location: "108 rue kleber 59170 Canne", description: "Toujours un Garage mal exposé")
g.remote_photo_url = "https://www.ctm-renovation.fr/wp-content/uploads/2016/04/construire-un-garage.jpg"
g.save!
g = Garage.create!(user: first_user, capacity: 8, price: 30, location: "3248 rue kleber 75000 Paris", description: "Encore un Garage bien isolé")
g.remote_photo_url = "https://www.degarageamersfoort.nl/userfiles/images/mbo_garage_bg_1.jpg"
g.save!

puts "finished"



