class CreateParts < ActiveRecord::Migration[5.0]
  def change
    create_table :parts do |t|
      t.references :product, foreign_key: true
      t.string :part_number
      t.text :note
      t.integer :epid, index: true
      t.boolean  :ebay_fitments_imported, default: false
      t.datetime :ebay_fitments_updated_at

      t.timestamps
    end
  end
end
