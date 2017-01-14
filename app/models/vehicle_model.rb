class VehicleModel < ApplicationRecord
  belongs_to :brand
  belongs_to :vehicle_type
  has_many :vehicle_submodels
end
