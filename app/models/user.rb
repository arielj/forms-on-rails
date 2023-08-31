class User < ApplicationRecord
  has_many :pets
  has_one :address

  validates :name, :lastname, presence: true

  accepts_nested_attributes_for :pets, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :address, update_only: true
end
