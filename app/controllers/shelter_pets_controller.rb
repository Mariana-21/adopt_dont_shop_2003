class ShelterPetsController < ApplicationController
  def index
    @shelter_pet = Shelter.find(params[:shelter_id])
  end 

  # def new
  #   @shelter_pet = Shelter.find(params[:shelter_id])
  # end 

  # def create
  #   shelter = Shelter.find(params[:shelter_id])
  #   pet = Pet.create(pet_params)
  #   pet.adoptable_status = "Adoptable"

  #   pet.save
  #   redirect_to "/shelters/#{shelter.id}/pets"
  # end 

  # private

  # def pet_params
  #   params.permit(:name, :description, :age, :sex, :image)
  # end
end
