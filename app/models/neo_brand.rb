class NeoBrand
  include Neo4j::ActiveNode

  id_property :brand_id
  property :name, type: String
  property :website
  property :about
  property :created_at
  property :updated_at

  validates_presence_of :name

  has_many :out, :neo_vehicle_models, type: :HAS_MODEL
  has_many :out, :neo_products, type: :HAS_PRODUCT
end
