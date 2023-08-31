class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit edit_dynamic update update_dynamic destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @user.pets.build
    @user.build_address
  end

  def new_dynamic
    @user = User.new
    @user.pets.build
    @user.build_address
  end

  # GET /users/1/edit
  def edit
  end

  # GET /users/1/edit_dynamic
  def edit_dynamic
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if params[:operation] == "save"
      if @user.save
        redirect_to user_url(@user), notice: "User was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    else
      @user.pets.build if params[:operation] == "add_pet"
      render :new
    end
  end

  def create_dynamic
    @user = User.new(user_params)

    if @user.save
      redirect_to user_url(@user), notice: "User was successfully created."
    else
      @user.pets.build
      render :new_dynamic, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user.attributes = user_params

    if params[:operation] == "save"
      if @user.save
        redirect_to user_url(@user), notice: "User was successfully updated."
      else
        render :edit_dynamic, status: :unprocessable_entity
      end
    else
      @user.pets.build if params[:operation] == "add_pet"
      render :edit
    end
  end

  def update_dynamic
    @user.attributes = user_params

    if @user.save
      redirect_to user_url(@user), notice: "User was successfully updated."
    else
      @user.pets.build
      render :edit_dynamic, status: :unprocessable_entity
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    redirect_to users_url, notice: "User was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(
        :name, :lastname,
        address_attributes: [:street, :city, :state],
        pets_attributes: [:id, :name, :bio, :color, :breed, :species, :_destroy]
      )
    end
end
