require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do 
  describe "when I visit a shelter show page" do 
    it " I can click a link to delete the shelter" do
      shelter1 = Shelter.create(name: "San Diego Humane Society", address: "5500 Gaines St", city: "San Diego", state: "CA", zip: "92110")
      shelter2 = Shelter.create(name: "La Costa Animal Hospital", address: "7668 El Camino Real #101", city: "Carlsbad", state: "CA", zip: "92009")
      shelter3 = Shelter.create(name: "DogSpot", address: "4151 Avenida Plaza Real", city: "Oceanside", state: "CA", zip: "92056")

      visit "/shelters/#{shelter3.id}"

      click_link"Delete Shelter"

      expect(current_path).to eq("/shelters")
      expect(page).to_not have_link(shelter3.name)
      expect(page).to have_link(shelter2.name) 
      expect(page).to have_link(shelter1.name)
    end
  end
end



# User Story 6, Shelter Delete

# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter