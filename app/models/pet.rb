class Pet < ApplicationRecord
  # if $next_rails
  #   normalizes :name, with: -> name { name.titleize }
  # else
  normalizy :name, with: :titleize
  # end

  belongs_to :user
  has_many :appointments

  validates :name, :species, presence: true

  accepts_nested_attributes_for :appointments
end
