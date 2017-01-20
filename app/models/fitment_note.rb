class FitmentNote < ApplicationRecord
  scope :leaves, -> { where.not(parent_id: nil)}
  validates :name, presence: true

  has_many :fitment_notations, dependent: :destroy

  has_many :variations,
    class_name: "FitmentNote",
    foreign_key: "parent_id",
    dependent: :destroy

  belongs_to :parent,
    class_name: "FitmentNote",
    foreign_key: "parent_id"
end
