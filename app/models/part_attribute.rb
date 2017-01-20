class PartAttribute < ApplicationRecord
  include NeoNodeable
  validates :name, presence: true

  has_many :part_attributions, dependent: :destroy

  has_many :variations,
    class_name: "PartAttribute",
    foreign_key: "parent_id",
    dependent: :destroy

  belongs_to :parent,
    class_name: "PartAttribute",
    foreign_key: "parent_id"

  def self.build_neo_nodes
    all.each do |part_attribute|
      node = NeoPartAttribute.create(part_attribute_id: part_attribute.id, name: part_attribute.name)
      NeoPartAttribute.find_by(part_attribute_id: part_attribute.parent_id).variations << node unless part_attribute.parent_id.nil?
    end
  end
end
