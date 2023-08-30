class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.text :bio
      t.string :color
      t.string :breed
      t.string :species
      t.references :user

      t.timestamps
    end
  end
end
