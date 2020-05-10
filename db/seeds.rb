# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Pet.destroy_all
Shelter.destroy_all

shelter1 = Shelter.create(name: "San Diego Humane Society", address: "5500 Gaines St", city: "San Diego", state: "CA", zip: "92110")
shelter2 = Shelter.create(name: "La Costa Animal Hospital", address: "7668 El Camino Real #101", city: "Carlsbad", state: "CA", zip: "92009")
shelter3 = Shelter.create(name: "DogSpot", address: "4151 Avenida Plaza Real", city: "Oceanside", state: "CA", zip: "92056")

pet1 = Pet.create(image: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2017/09/chihuahua-names-1.jpg",
                  name: "Skip", description: "I am very energetic, I love to be around people!", age: "2", sex: "Male", adoptable_status: "Adoptable", shelter_id: shelter1.id)
pet2 = Pet.create(image: "https://www.thepaws.net/wp-content/uploads/2018/09/beagle-bloodhound-dog-mix-2.jpg",
                  name: "Yayla", description: "I am the calmest dog you will ever meet, I love belly rubs and lots of treats", age: "4", sex: "Female", adoptable_status: "Adoptable", shelter_id: shelter2.id)
pet3 = Pet.create(image: "https://www.dogster.com/wp-content/uploads/2018/12/german-shepard-dog-face.jpg", 
                  name: "Shadow", description: "I'm a German Sheperd and I love to play and go on walks!", age: "3", sex: "Male", adoptable_status: "Adoptable", shelter_id: shelter3.id)
pet4 = Pet.create(image: "https://i.pinimg.com/originals/16/f3/9e/16f39e58bede777ff5ad25e57521efb4.jpg",
                  name: "Max", description: "I am a 3 year old Rottweiler, super friendly and love to play!", age: "3", sex: "Male", adoptable_status: "Adoptable", shelter_id: shelter2.id)
