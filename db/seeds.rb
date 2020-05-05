# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
shelter1 = Shelter.create(name: "San Diego Humane Society", address: "5500 Gaines St", city: "San Diego", state: "CA", zip: "92110")
shelter2 = Shelter.create(name: "La Costa Animal Hospital", address: "7668 El Camino Real #101", city: "Carlsbad", state: "CA", zip: "92009")
shelter3 = Shelter.create(name: "DogSpot", address: "4151 Avenida Plaza Real", city: "Oceanside", state: "CA", zip: "92056")
