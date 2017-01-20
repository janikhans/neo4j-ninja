class Category < ApplicationRecord
  include NeoNodeable
  has_many :products
  has_many :subcategories,
    class_name: "Category",
    foreign_key: "parent_id",
    dependent: :destroy

  belongs_to :parent_category,
    class_name: "Category",
    foreign_key: "parent_id",
    required: false

  def self.build_neo_nodes
    all.each do |category|
      node = NeoCategory.create(category_id: category.id, name: category.name)
      NeoCategory.find_by(category_id: category.parent_id).subcategories << node unless category.parent_id.nil?
    end
  end
end
