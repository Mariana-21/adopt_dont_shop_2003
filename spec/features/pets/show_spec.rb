require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do 
  describe "when I visit a pets' show page" do 
    it "I can see all of their info" do 
      shelter1 = Shelter.create(name: "San Diego Humane Society", address: "5500 Gaines St", city: "San Diego", state: "CA", zip: "92110")
      shelter2 = Shelter.create(name: "La Costa Animal Hospital", address: "7668 El Camino Real #101", city: "Carlsbad", state: "CA", zip: "92009")
      shelter3 = Shelter.create(name: "DogSpot", address: "4151 Avenida Plaza Real", city: "Oceanside", state: "CA", zip: "92056")

      pet1 = Pet.create(image: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2017/09/chihuahua-names-1.jpg",
                              name: "Skip", age: "2", sex: "Male", shelter_id: shelter1.id)
      pet2 = Pet.create(image: "https://www.thepaws.net/wp-content/uploads/2018/09/beagle-bloodhound-dog-mix-2.jpg",
                              name: "Yayla", age: "4", sex: "Female", shelter_id: shelter2.id)
      pet3 = Pet.create(image: "https://www.dogster.com/wp-content/uploads/2018/12/german-shepard-dog-face.jpg", 
                              name: "Shadow", age: "3", sex: "Male", shelter_id: shelter3.id)
      pet4 = Pet.create(image: "https://i.pinimg.com/originals/16/f3/9e/16f39e58bede777ff5ad25e57521efb4.jpg",
                        name: "Max", description: "I am a 3 year old rottweiler, super friendly and love to play!", age: "3", sex: "Male",adoptable_status: "Adoptable", shelter_id: shelter2.id)

      visit "/pets/#{pet4.id}"

      expect(page).to have_css("img[src*='#{pet4.image}']")
      expect(page).to have_content(pet4.name) 
      expect(page).to have_content(pet4.description) 
      expect(page).to have_content(pet4.age) 
      expect(page).to have_content(pet4.sex) 
      expect(page).to have_content(pet4.adoptable_status) 
    end
  end
end