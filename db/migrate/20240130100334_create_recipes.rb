class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.json :recipe_data

      t.timestamps
    end
  end
end
