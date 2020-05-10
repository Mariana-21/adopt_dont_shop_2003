require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do 
  describe "when I visit a shelter index page" do 
    it " I can click a link to delete the shelter" do
      shelter1 = Shelter.create(name: "San Diego Humane Society", address: "5500 Gaines St", city: "San Diego", state: "CA", zip: "92110")
      shelter2 = Shelter.create(name: "La Costa Animal Hospital", address: "7668 El Camino Real #101", city: "Carlsbad", state: "CA", zip: "92009")
      shelter3 = Shelter.create(name: "DogSpot", address: "4151 Avenida Plaza Real", city: "Oceanside", state: "CA", zip: "92056")

      visit "/shelters"

      within "#shelter-#{shelter3.id}" do
        click_link"Delete Shelter"
      end


      expect(current_path).to eq("/shelters")
      expect(page).to_not have_link(shelter3.name)
      expect(page).to have_link(shelter2.name) 
      expect(page).to have_link(shelter1.name)
    end
  end
end
