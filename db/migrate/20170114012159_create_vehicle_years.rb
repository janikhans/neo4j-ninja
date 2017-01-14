class CreateVehicleYears < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_years do |t|
      t.int :year

      t.timestamps
    end
  end
end
