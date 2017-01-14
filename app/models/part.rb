class Part < ApplicationRecord
  belongs_to :product
  has_many :fitments
end
