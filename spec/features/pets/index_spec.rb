require 'rails_helper'


RSpec.describe "As a visitor", type: :feature do
  describe "when I visit the pet index page" do 
    it "I can see all the pets and their info" do 
      shelter1 = Shelter.create(name: "San Diego Humane Society", address: "5500 Gaines St", city: "San Diego", state: "CA", zip: "92110")
      shelter2 = Shelter.create(name: "La Costa Animal Hospital", address: "7668 El Camino Real #101", city: "Carlsbad", state: "CA", zip: "92009")
      shelter3 = Shelter.create(name: "DogSpot", address: "4151 Avenida Plaza Real", city: "Oceanside", state: "CA", zip: "92056")

      pet1 = Pet.create(image: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2017/09/chihuahua-names-1.jpg",
                        name: "Skip", age: "2", sex: "Male", shelter_id: shelter1.id)
      pet2 = Pet.create(image: "https://www.thepaws.net/wp-content/uploads/2018/09/beagle-bloodhound-dog-mix-2.jpg",
                        name: "Yayla", age: "4", sex: "Female", shelter_id: shelter2.id)
      pet3 = Pet.create(image: "https://www.dogster.com/wp-content/uploads/2018/12/german-shepard-dog-face.jpg", 
                        name: "Shadow", age: "3", sex: "Male", shelter_id: shelter3.id)

      visit "/pets"

      expect(page).to have_css("img[src*='#{pet1.image}']")
      expect(page).to have_content(pet1.name) 
      expect(page).to have_content(pet1.age) 
      expect(page).to have_content(pet1.sex) 
      expect(page).to have_content(shelter1.name) 
      expect(page).to have_css("img[src*='#{pet2.image}']")
      expect(page).to have_css("img[src*='#{pet3.image}']")
    end
  end
end