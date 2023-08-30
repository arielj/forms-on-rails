class AddressesController < ApplicationController
  before_action :set_address, only: %i[ show edit update destroy ]

  # GET /addresses or /addresses.json
  def index
    @addresses = Address.all
  end

  # GET /addresses/1 or /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses or /addresses.json
  def create
    @address = Address.new(address_params)

    if @address.save
      redirect_to address_url(@address), notice: "Address was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /addresses/1 or /addresses/1.json
  def update
    if @address.update(address_params)
      redirect_to address_url(@address), notice: "Address was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /addresses/1 or /addresses/1.json
  def destroy
    @address.destroy

    redirect_to addresses_url, notice: "Address was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:street, :city, :state)
    end
end
