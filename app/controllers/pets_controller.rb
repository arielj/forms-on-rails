class PetsController < ApplicationController
  before_action :set_pet, only: %i[ show edit update destroy ]

  # GET /pets or /pets.json
  def index
    @pets = Pet.all
  end

  # GET /pets/1 or /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets or /pets.json
  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      redirect_to pet_url(@pet), notice: "Pet was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pets/1 or /pets/1.json
  def update
    if @pet.update(pet_params)
      redirect_to pet_url(@pet), notice: "Pet was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /pets/1 or /pets/1.json
  def destroy
    @pet.destroy

    redirect_to pets_url, notice: "Pet was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pet_params
      params.require(:pet).permit(:name, :bio, :color, :breed, :species)
    end
end
