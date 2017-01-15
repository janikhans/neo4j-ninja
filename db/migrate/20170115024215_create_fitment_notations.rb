class CreateFitmentNotations < ActiveRecord::Migration[5.0]
  def change
    create_table :fitment_notations do |t|
      t.references :fitment_note, foreign_key: true
      t.references :fitment, foreign_key: true

      t.timestamps
    end
  end
end
