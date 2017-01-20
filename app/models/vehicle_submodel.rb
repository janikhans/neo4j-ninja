class VehicleSubmodel < ApplicationRecord
  include NeoNodeable
  belongs_to :vehicle_model
  has_many :vehicles

  def self.build_neo_nodes
    all.each do |vehicle_submodel|
      node = NeoVehicleSubmodel.create(vehicle_submodel_id: vehicle_submodel.id, name: vehicle_submodel.name)
      NeoVehicleModel.find_by(vehicle_model_id: vehicle_submodel.vehicle_model_id).neo_vehicle_submodels << node
    end
  end
end
