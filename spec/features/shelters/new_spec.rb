require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I go to the indexpage" do 
    it "I can click a link to make a new shelter" do 
      shelter1 = Shelter.create(name: "San Diego Humane Society", address: "5500 Gaines St", city: "San Diego", state: "CA", zip: "92110")
      shelter2 = Shelter.create(name: "La Costa Animal Hospital", address: "7668 El Camino Real #101", city: "Carlsbad", state: "CA", zip: "92009")
      shelter3 = Shelter.create(name: "DogSpot", address: "4151 Avenida Plaza Real", city: "Oceanside", state: "CA", zip: "92056")

      visit "/shelters"

      expect(page).to have_link("New Shelter")
      
      click_link"New Shelter"

      expect(current_path).to eq("/shelters/new")

      fill_in "Name",	with: "Laguna Beach Animal Shelter" 
      fill_in "Address",	with: "20612 Laguna Canyon Rd" 
      fill_in "City",	with: "Laguna Beach"
      fill_in "State",	with: "CA"
      fill_in "Zip",	with: "92651"

      click_button"Create Shelter"
      
      expect(current_path).to eq("/shelters")
      expect(page).to have_link("Laguna Beach Animal Shelter") 
    end
  end
end

# And I click the button "Create Shelter" to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.