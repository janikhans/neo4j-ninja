class VehicleType < ApplicationRecord
  include NeoNodeable
  has_many :subtypes,
    class_name: "VehicleType",
    foreign_key: "parent_id",
    dependent: :destroy

  belongs_to :parent_type,
    class_name: "VehicleType",
    foreign_key: "parent_id",
    required: false

  def self.build_neo_nodes
    all.each do |vehicle_type|
      NeoVehicleType.create(vehicle_type_id: vehicle_type.id, name: vehicle_type.name)
    end
  end
end
