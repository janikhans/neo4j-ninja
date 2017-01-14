class VehicleYear < ApplicationRecord
  has_many :vehicles

  def self.build_neo_nodes
    all.each do |vehicle_year|
      NeoVehicleYear.create(vehicle_year_id: vehicle_year.id, year: vehicle_year.year)
    end
  end
end
