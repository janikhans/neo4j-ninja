class VehicleModel < ApplicationRecord
  belongs_to :brand
  belongs_to :vehicle_type
  has_many :vehicle_submodels

  def self.build_neo_nodes
    all.each do |vehicle_model|
      node = NeoVehicleModel.create(vehicle_model_id: vehicle_model.id, name: vehicle_model.name)
      NeoBrand.find_by(brand_id: vehicle_model.brand_id).neo_vehicle_models << node
      NeoVehicleType.find_by(vehicle_type_id: vehicle_model.vehicle_type_id).neo_vehicle_models << node
    end
  end
end
