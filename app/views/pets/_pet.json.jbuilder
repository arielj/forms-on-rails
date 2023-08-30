json.extract! pet, :id, :name, :bio, :color, :breed, :species, :created_at, :updated_at
json.url pet_url(pet, format: :json)
