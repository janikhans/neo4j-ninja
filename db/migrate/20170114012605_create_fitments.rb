class CreateFitments < ActiveRecord::Migration[5.0]
  def change
    create_table :fitments do |t|
      t.references :part, foreign_key: true
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
