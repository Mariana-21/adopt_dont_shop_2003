class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end 

  def show
    @pet = Pet.find(params[:pet_id])
  end

  def new
    @shelter_pet = Shelter.find(params[:shelter_id])
  end 

  def create
    shelter = Shelter.find(params[:shelter_id])
    pet = shelter.pets.create(pet_params)
    pet.adoptable_status = "Adoptable"

    pet.save
    redirect_to "/shelters/#{shelter.id}/pets"
  end 

  def edit 
    @pet = Pet.find(params[:pet_id])
  end 

  def update
    pet = Pet.find(params[:pet_id])
    pet.update(pet_params)

    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    pet = Pet.find(params[:pet_id])

    pet.destroy
    redirect_to "/pets"
  end 

  private

  def pet_params
    params.permit(:name, :description, :age, :sex, :image)
  end
end
