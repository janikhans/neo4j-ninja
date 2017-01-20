class NeoVehicle
  include Neo4j::ActiveNode

  id_property :vehicle_id
  property :displacement, type: Integer
  property :displacement_units, type: String, default: "cc"
  property :created_at
  property :updated_at
  has_many :out, :neo_fitments, type: :HAS_VEHICLE_FITMENT
  has_one :in, :neo_vehicle_year, type: :HAS_YEAR_VEHICLE
end
