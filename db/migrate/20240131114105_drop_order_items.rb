class DropOrderItems < ActiveRecord::Migration[7.1]
  def up
    drop_table :order_items
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
