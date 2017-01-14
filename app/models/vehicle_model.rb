class VehicleModel < ApplicationRecord
  belongs_to :brand
  has_many :vehicle_submodels
end
