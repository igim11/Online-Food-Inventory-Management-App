class CreateMeals < ActiveRecord::Migration[7.1]
  def change
    create_table :meals do |t|
      t.string :meals_name
      t.text :meals_description
      t.integer :meals_price, default: 0
      t.text :meals_directions, array: true, default: []
      t.text :meals_nutritions, array: true, default: []
      t.timestamps
    end
  end
end
