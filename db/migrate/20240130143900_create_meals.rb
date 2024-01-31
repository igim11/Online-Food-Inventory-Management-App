class CreateMeals < ActiveRecord::Migration[7.1]
  def change
    create_table :meals do |t|
      t.string :meals_name
      t.text :meals_description
      t.text :meals_directions
      t.text :meals_nutritions
      t.integer :meals_price
      t.timestamps
    end
  end
end
