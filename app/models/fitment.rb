class Fitment < ApplicationRecord
  belongs_to :part
  belongs_to :vehicle
  has_many :fitment_notations, dependent: :destroy
  has_many :fitment_notes, through: :fitment_notations, source: :fitment_note
  enum source: [:user, :ebay]

  def self.build_neo_nodes

    all.each do |fitment|
      fitment_notes = fitment.fitment_notes.map { |f| hash = Hash.new; hash[f.parent.name.underscore.to_sym] = f.name; hash }.reduce({}, :merge)
      node = NeoFitment.new(fitment_id: fitment.id, source: fitment.source, note: fitment.note)
      node.assign_attributes(fitment_notes)
      node.save
      NeoVehicle.find(fitment.vehicle_id).neo_fitments << node
      NeoPart.find(fitment.part_id).neo_fitments << node
    end
  end
end
