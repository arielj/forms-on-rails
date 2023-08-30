class Pet < ApplicationRecord
  belongs_to :user
  has_many :appointments

  validates :name, :species, presence: true

  accepts_nested_attributes_for :appointments
end
