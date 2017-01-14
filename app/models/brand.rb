class Brand < ApplicationRecord
  has_many :vehicle_models
  has_many :products
end
