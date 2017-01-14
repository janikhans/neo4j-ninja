class Fitment < ApplicationRecord
  belongs_to :part
  belongs_to :vehicle
end
