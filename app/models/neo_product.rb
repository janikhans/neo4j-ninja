class NeoProduct
  include Neo4j::ActiveNode

  id_property :product_id
  property :name, type: String
  property :created_at
  property :updated_at

  has_many :out, :neo_parts, type: :HAS_PART
end
