class AddUserIdToMeals < ActiveRecord::Migration[7.1]
  def change
    add_column :meals, :user_id, :integer
  end
end
