class CreateVehicleSubmodels < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_submodels do |t|
      t.references :vehicle_model, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
