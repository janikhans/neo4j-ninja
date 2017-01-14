class Category < ApplicationRecord
  has_many :products
  has_many :subcategories,
    class_name: "Category",
    foreign_key: "parent_id",
    dependent: :destroy

  belongs_to :parent_category,
    class_name: "Category",
    foreign_key: "parent_id",
    required: false
end
