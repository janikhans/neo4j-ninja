class NeoVehicleType
  include Neo4j::ActiveNode

  id_property :vehicle_type_id
  property :name, type: String
  property :created_at
  property :updated_at

  has_many :out, :neo_vehicle_models, type: :HAS_MODEL
end
