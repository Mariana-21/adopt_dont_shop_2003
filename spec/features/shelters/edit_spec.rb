require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit shelter show page" do 
    it "I can click a link to edit the shelter" do 
      shelter1 = Shelter.create(name: "San Diego Humane Society", address: "5500 Gaines St", city: "San Diego", state: "CA", zip: "92110")
      shelter2 = Shelter.create(name: "La Costa Animal Hospital", address: "7668 El Camino Real #101", city: "Carlsbad", state: "CA", zip: "92009")
      shelter3 = Shelter.create(name: "DogSpot", address: "4151 Avenida Plaza Real", city: "Oceanside", state: "CA", zip: "92056")

      visit "/shelters/#{shelter2.id}"

      click_link"Update Shelter"

      fill_in "Name",	with: "La Costa Animal Shelter" 
      fill_in "Address",	with: "7668 El Camino Real #102" 
      fill_in "City",	with: "Carlsbad" 
      fill_in "State",	with: "California" 
      fill_in "Zip",	with: "92110" 

      click_button"Update"

      expect(current_path).to eq("/shelters/#{shelter2.id}") 
      expect(page).to have_content("La Costa Animal Shelter") 
      expect(page).to have_content("7668 El Camino Real #102") 
      expect(page).to have_content("Carlsbad") 
      expect(page).to have_content("California") 
      expect(page).to have_content("92110") 
    end
  end
end