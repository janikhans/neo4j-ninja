class Part < ApplicationRecord
  belongs_to :product
  has_many :fitments
  has_many :oem_vehicles, through: :fitments, source: :vehicle

  def self.build_neo_nodes
    all.each do |part|
      node = NeoPart.create(part_id: part.id, part_number: part.part_number)
      NeoProduct.find_by(product_id: part.product_id).neo_parts << node
    end
  end
end
