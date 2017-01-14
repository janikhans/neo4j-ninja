class Vehicle < ApplicationRecord
  belongs_to :vehicle_submodel
  belongs_to :vehicle_year
  has_many :fitments
end
