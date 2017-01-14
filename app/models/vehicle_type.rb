class VehicleType < ApplicationRecord
  has_many :subtypes,
    class_name: "VehicleType",
    foreign_key: "parent_id",
    dependent: :destroy

  belongs_to :parent_type,
    class_name: "VehicleType",
    foreign_key: "parent_id",
    required: false
end
