class CreatePartAttributions < ActiveRecord::Migration[5.0]
  def change
    create_table :part_attributions do |t|
      t.references :part_attribute, foreign_key: true
      t.references :part, foreign_key: true

      t.timestamps
    end
  end
end
