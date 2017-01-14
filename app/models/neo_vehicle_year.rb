class NeoVehicleYear
  include Neo4j::ActiveNode

  id_property :vehicle_year_id
  property :year, type: Integer
  property :created_at
  property :updated_at

  has_many :out, :neo_vehicles, type: :HAS_VEHICLE
end
