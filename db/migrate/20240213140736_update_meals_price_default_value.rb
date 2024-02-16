class UpdateMealsPriceDefaultValue < ActiveRecord::Migration[7.1]
  def up
    change_column_default :meals, :meals_price, 0
  end
end
