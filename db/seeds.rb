# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating new users"
Review.destroy_all
puts "Review destroyed"
Rental.destroy_all
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
Garage.destroy_all

puts "Creating new garages"


first_user = User.first
last_user = User.last

g = Garage.create!(user: first_user, capacity: 10, price: 50, location: "6 rue des jonquilles", postale: 59830, city: 'Bourghelles', description: "Grand Garage")
g.remote_photo_url = "https://media.gettyimages.com/photos/garage-picture-id528098460?s=612x612"
g.full_address = "#{g.location} #{g.postale} #{g.city}"
g.save!
g = Garage.create!(user: first_user, capacity: 6, price: 30, location: "10 rue patou", postale: 59000, city: 'Lille', description: "Magnifique Garage éclairé")
g.remote_photo_url = "https://www.degarageamersfoort.nl/userfiles/images/mbo_garage_bg_1.jpg"
g.full_address = "#{g.location} #{g.postale} #{g.city}"
g.save!
g = Garage.create!(user: last_user, capacity: 7, price: 30, location: "99 rue kleber", postale: 59170, city: 'Croix', description: "Petit Garage plein nord")
g.remote_photo_url = "https://www.ctm-renovation.fr/wp-content/uploads/2016/04/construire-un-garage.jpg"
g.full_address = "#{g.location} #{g.postale} #{g.city}"
g.save!
g = Garage.create!(user: last_user, capacity: 6, price: 10, location: "12 rue de bourgogne", postale: 59000, city: 'Lille', description: "Magnifique Garage plein sud")
g.remote_photo_url = "https://www.steeltechsheds.ie/wp-content/gallery/garages-2017/26ft-x-17ft-garage.jpg"
g.full_address = "#{g.location} #{g.postale} #{g.city}"
g.save!
g = Garage.create!(user: last_user, capacity: 12, price: 20, location: "15 rue paul ramadier", postale: 59800, city: 'Lille', description: "Toujours un Garage mal exposé")
g.remote_photo_url = "https://www.ctm-renovation.fr/wp-content/uploads/2016/04/construire-un-garage.jpg"
g.full_address = "#{g.location} #{g.postale} #{g.city}"
g.save!
g = Garage.create!(user: first_user, capacity: 8, price: 30, location: "12 rue nationale", postale: 59000, city: 'Lille', description: "Encore un Garage bien isolé")
g.remote_photo_url = "https://www.degarageamersfoort.nl/userfiles/images/mbo_garage_bg_1.jpg"
g.full_address = "#{g.location} #{g.postale} #{g.city}"
g.save!
g = Garage.create!(user: last_user, capacity: 12, price: 25, location: "10 rue paul ramadier", postale: 59800, city: 'Lille', description: "Toujours un Garage mal exposé")
g.remote_photo_url = "https://www.ctm-renovation.fr/wp-content/uploads/2016/04/construire-un-garage.jpg"
g.full_address = "#{g.location} #{g.postale} #{g.city}"
g.save!

puts "finished"



