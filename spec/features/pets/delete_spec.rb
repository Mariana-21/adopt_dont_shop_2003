require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do 
  describe "when I visit a pet show page" do
    it "I can click a link to delete that pet" do 
      shelter2 = Shelter.create(name: "La Costa Animal Hospital", address: "7668 El Camino Real #101", city: "Carlsbad", state: "CA", zip: "92009")

      pet2 = Pet.create(image: "https://www.thepaws.net/wp-content/uploads/2018/09/beagle-bloodhound-dog-mix-2.jpg",
                        name: "Yayla", description: "I am the calmest dog you will ever meet, I love belly rubs and lots of treats", age: "4", sex: "Female", adoptable_status: "Adoptable", shelter_id: shelter2.id)
      pet4 = Pet.create(image: "https://i.pinimg.com/originals/16/f3/9e/16f39e58bede777ff5ad25e57521efb4.jpg",
                        name: "Max", description: "I am a 3 year old Rottweiler, super friendly and love to play!", age: "3", sex: "Male", adoptable_status: "Adoptable", shelter_id: shelter2.id)

      visit "/pets/#{pet4.id}"

      click_link"Delete Pet" 

      expect(current_path).to eq("/pets") 
      expect(page).to have_content(pet2.name) 
      expect(page).to_not have_content(pet4.name)
    end
  end
end

# User Story 12, Pet Delete

# As a visitor
# When I visit a pet show page
# Then I see a link to delete the pet "Delete Pet"
# When I click the link
# Then a 'DELETE' request is sent to '/pets/:id',
# the pet is deleted,
# and I am redirected to the pet index page where I no longer see this pet