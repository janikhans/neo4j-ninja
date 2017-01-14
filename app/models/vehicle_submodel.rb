class VehicleSubmodel < ApplicationRecord
  belongs_to :vehicle_model
  has_many :vehicles
end
