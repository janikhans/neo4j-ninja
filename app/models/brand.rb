class Brand < ApplicationRecord
  has_many :vehicle_models
  has_many :products

  after_save :update_neo_node

  def self.build_neo_nodes
    all.each do |brand|
      NeoBrand.create(brand_id: brand.id, name: brand.name)
    end
  end

  def update_neo_node
    # binding.pry
    NeoBrand.find(self.id).update(name: self.name)
  end
end
