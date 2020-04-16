class AddSizeRefToOrderItem < ActiveRecord::Migration[6.0]
  def change
    add_reference :order_items, :size, null: false, foreign_key: true
  end
end
