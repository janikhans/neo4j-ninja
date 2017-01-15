class Fitment < ApplicationRecord
  belongs_to :part
  belongs_to :vehicle
  has_many :fitment_notations, dependent: :destroy
  has_many :fitment_notes, through: :fitment_notations, source: :fitment_note

  enum source: [:user, :ebay]

  def self.build_neo_nodes
    all.each do |fitment|
      vehicle = NeoVehicle.find_by(vehicle_id: fitment.vehicle_id)
      part = NeoPart.find_by(part_id: fitment.part_id)
      part.neo_vehicles << vehicle
      vehicle.neo_parts << part
    end
  end
end
