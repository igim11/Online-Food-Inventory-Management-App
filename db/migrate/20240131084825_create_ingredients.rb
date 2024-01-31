class CreateIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.float :quantity_on_hand
      t.string :unit_of_measurement

      t.timestamps
    end
  end
end
