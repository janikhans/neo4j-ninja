class NeoCategory
  include Neo4j::ActiveNode

  id_property :category_id
  property :name, type: String
  property :created_at
  property :updated_at

  has_many :out, :subcategories, type: :HAS_SUBCATEGORY, model_class: :NeoCategory
  has_many :out, :neo_products, type: :HAS_CATEGORY_PRODUCT
end
