class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.references :vehicle_submodel, foreign_key: true
      t.references :vehicle_year, foreign_key: true
      t.integer :epid, index: true
      t.integer :displacement
      t.string :displacement_units

      t.timestamps
    end
  end
end
