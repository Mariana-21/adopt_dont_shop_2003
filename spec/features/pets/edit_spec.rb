require 'rails_helper'

RSpec.describe "As a visitor" do 
  describe "When I visit a pets show page" do 
    it "I can click on a link to update that pet" do 
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

      visit"/pets/#{pet3.id}"

      click_link"Update Pet"

      expect(current_path).to eq("/pets/#{pet3.id}/edit") 

      fill_in "Image",	with: "https://www.dogster.com/wp-content/uploads/2018/12/german-shepard-dog-face.jpg" 
      fill_in "Name",	with: "Shadow" 
      fill_in "Description",	with: "I'm a German Sheperd and I'm super energetic. I love to play and go on walks!" 
      fill_in "Age",	with: "3 years old" 
      fill_in "Sex",	with: "Male"
  
      click_button"Update Pet"

      expect(current_path).to eq("/pets/#{pet3.id}")
      expect(page).to have_content("I'm a German Sheperd and I'm super energetic. I love to play and go on walks!") 
      expect(page).to have_content("3 years old")

      visit"/pets/#{pet1.id}"

      click_link"Update Pet"

      expect(current_path).to eq("/pets/#{pet1.id}/edit") 

      fill_in "Image",	with: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2017/09/chihuahua-names-1.jpg" 
      fill_in "Name",	with: "Skip" 
      fill_in "Description",	with: "I am very energetic, I love to be around people!" 
      fill_in "Age",	with: "2 years old" 
      fill_in "Sex",	with: "Male"
  
      click_button"Update Pet"

      expect(current_path).to eq("/pets/#{pet1.id}")
      expect(page).to have_content("I am very energetic, I love to be around people!") 
      expect(page).to have_content("2 years old")
    end
  end
end
# User Story 11, Pet Update

# As a visitor
# When I visit a Pet Show page
# Then I see a link to update that Pet "Update Pet"
# When I click the link 
# I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including:
# - image
# - name
# - description
# - approximate age
# - sex
# When I click the button to submit the form "Update Pet"
# Then a `PATCH` request is sent to '/pets/:id',
# the pet's data is updated,
# and I am redirected to the Pet Show page where I see the Pet's updated information