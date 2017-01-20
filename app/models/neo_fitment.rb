class NeoFitment
  include Neo4j::ActiveNode

  id_property :fitment_id

  property :note
  property :location, type: String
  property :quantity, type: Integer
  property :source
end
