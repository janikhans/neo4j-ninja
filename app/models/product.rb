class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category
  has_many :parts

  def self.build_neo_nodes
    all.each do |product|
      node = NeoProduct.create(product_id: product.id, name: product.name)
      NeoBrand.find_by(brand_id: product.brand_id).neo_products << node
      NeoCategory.find_by(category_id: product.category_id).neo_products << node
    end
  end
end
