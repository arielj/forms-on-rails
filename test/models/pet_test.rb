require "test_helper"

class PetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "normalized the name" do
    pet = Pet.new name: "chanchi"

    assert_equal pet.name, "Chanchi"
  end
end
