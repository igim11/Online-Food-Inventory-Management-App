class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :recipe, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
