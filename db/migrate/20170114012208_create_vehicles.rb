class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.references :vehicle_submodel, foreign_key: true
      t.references :vehicle_year, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
