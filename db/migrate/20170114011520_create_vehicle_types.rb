class CreateVehicleTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_types do |t|
      t.string :name, null: false
      t.integer :parent_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
