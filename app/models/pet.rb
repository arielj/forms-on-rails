class Pet < ApplicationRecord
  # if $next_rails
  #   query_constraints :user, :group
  # else
  #   self.primary_keys = :user_id, :group_id
  # end

  belongs_to :user
  has_many :appointments

  validates :name, :species, presence: true

  accepts_nested_attributes_for :appointments
end
