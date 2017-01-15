class CreateFitments < ActiveRecord::Migration[5.0]
  def change
    create_table :fitments do |t|
      t.integer, :source
      t.text, :note
      t.references :part, foreign_key: true
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
    add_index :fitments, [:part_id, :vehicle_id], unique: true
  end
end
