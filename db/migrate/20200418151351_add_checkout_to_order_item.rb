class AddCheckoutToOrderItem < ActiveRecord::Migration[6.0]
  def change
    add_reference :order_items, :checkout, null: true, foreign_key: true
    change_column :order_items, :order_id, :integer, null: true
  end
end
