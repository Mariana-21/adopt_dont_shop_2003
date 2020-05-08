require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do 
  describe "when I go to the shelter pets index page" do
    it "I can click a link to create a new pet" do 
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

      visit "/shelters/#{shelter2.id}/pets"

      click_link"Create Pet"

      expect(current_path).to eq("/shelters/#{shelter2.id}/pets/new") 

      fill_in "Image",	with: "https://i.pinimg.com/originals/8c/cf/ec/8ccfec7d5cb3c92265cbf153523eb9b5.jpg" 
      fill_in "Name",	with: "Comet" 
      fill_in "Description",	with: "I'm a little lab, yet to be completely house trained, but I learn very fast and I love to have fun!" 
      fill_in "Age",	with: "2 months" 
      fill_in "Sex",	with: "Male" 

      click_button"Create Pet"

      expect(current_path).to eq("/shelters/#{shelter2.id}/pets") 

      expect(page).to have_link("Comet")
      expect(page).to have_content("2 months")
      expect(page).to have_content("Male")
    end
  end
end