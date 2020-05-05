require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I go to the show page" do 
    it "I can see all the shelters information" do 
      shelter1 = Shelter.create(name: "San Diego Humane Society", address: "5500 Gaines St", city: "San Diego", state: "CA", zip: "92110")
      shelter2 = Shelter.create(name: "La Costa Animal Hospital", address: "7668 El Camino Real #101", city: "Carlsbad", state: "CA", zip: "92009")
      shelter3 = Shelter.create(name: "DogSpot", address: "4151 Avenida Plaza Real", city: "Oceanside", state: "CA", zip: "92056")

      visit "/shelters"

      click_link"#{shelter1.name}"

      expect(current_path).to eq("/shelters/#{shelter1.id}")

      expect(page).to have_content(shelter1.name)
      expect(page).to have_content(shelter1.address)
      expect(page).to have_content(shelter1.city)
      expect(page).to have_content(shelter1.state)
      expect(page).to have_content(shelter1.zip)
      expect(page).to_not have_content(shelter2.name)  
      expect(page).to_not have_content(shelter2.address)
      expect(page).to_not have_content(shelter3.name)
      expect(page).to_not have_content(shelter3.address)
    end
  end
end






# As a visitor
# When I visit '/shelters/:id'
# Then I see the shelter with that id including the shelter's:
# - name
# - address
# - city
# - state
# - zip