class CreatePartAttributes < ActiveRecord::Migration[5.0]
  def change
    create_table :part_attributes do |t|
      t.string :name
      t.integer :parent_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
