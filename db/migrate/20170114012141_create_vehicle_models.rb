class CreateVehicleModels < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_models do |t|
      t.references :brand, foreign_key: true
      t.references :vehicle_type, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
