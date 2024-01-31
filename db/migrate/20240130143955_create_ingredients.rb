class CreateIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients do |t|
      t.text :ingredients_details, array: true, default: [], null: false
      t.references :meal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
