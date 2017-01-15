class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :description
      t.integer :parent_id, foreign_key: true

      t.timestamps
    end
  end
end
