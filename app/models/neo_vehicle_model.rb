class NeoVehicleModel
  include Neo4j::ActiveNode

  id_property :vehicle_model_id
  property :name, type: String
  property :created_at
  property :updated_at

  has_many :out, :neo_vehicle_submodels, type: :HAS_SUBMODEL
  # has_one :in, :neo_vehicle_type, origin: :neo_vehicle_models
  # has_one :in, :neo_brand, origin: :neo_vehicle_model
end
