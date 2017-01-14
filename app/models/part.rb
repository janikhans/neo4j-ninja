class Part < ApplicationRecord
  belongs_to :product
  has_many :fitments
  has_many :oem_vehicles, through: :fitments, source: :vehicle
end
