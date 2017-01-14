class NeoVehicleSubmodel
  include Neo4j::ActiveNode

  id_property :vehicle_submodel_id
  property :name, type: String
  property :created_at
  property :updated_at

  has_many :out, :neo_vehicles, type: :HAS_VEHICLE
end
