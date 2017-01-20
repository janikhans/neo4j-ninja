class NeoPart
  include Neo4j::ActiveNode

  id_property :part_id
  property :part_number, type: String
  property :note
  property :created_at
  property :updated_at

  has_many :out, :neo_fitments, type: :HAS_PART_FITMENT
end
