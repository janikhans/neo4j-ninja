class CreateFitmentNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :fitment_notes do |t|
      t.string :name
      t.integer :parent_id
      t.boolean :used_for_search

      t.timestamps
    end
  end
end
