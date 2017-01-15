class CreateVehicleYears < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_years do |t|
      t.integer :year, null: false

      t.timestamps
    end
  end
end
