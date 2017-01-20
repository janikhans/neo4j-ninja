class Brand < ApplicationRecord
  include NeoNodeable
  has_many :vehicle_models
  has_many :products

  def self.build_neo_nodes
    all.each do |brand|
      NeoBrand.create(brand_id: brand.id, name: brand.name)
    end
  end
end
