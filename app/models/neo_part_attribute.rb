class NeoPartAttribute
  include Neo4j::ActiveNode

  id_property :part_attribute_id
  property :name, type: String
  property :created_at
  property :updated_at

  has_many :out, :variations, type: :HAS_VARIATION, model_class: :NeoPartAttribute
  has_many :out, :neo_parts, type: :HAS_ATTRIBUTE_PART
end
