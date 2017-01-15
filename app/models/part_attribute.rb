class PartAttribute < ApplicationRecord
  validates :name, presence: true
  
  has_many :part_attributions, dependent: :destroy

  has_many :variations,
    class_name: "PartAttribute",
    foreign_key: "parent_id",
    dependent: :destroy

  belongs_to :parent,
    class_name: "PartAttribute",
    foreign_key: "parent_id"
end
