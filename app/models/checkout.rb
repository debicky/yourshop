class Checkout < ApplicationRecord
  validates :first_name, :last_name, :address, :pay_type, :city, :country, :postal_code, presence: true
  has_many :order_items, dependent: :destroy
  


  enum pay_type: {
    "Paypal" => 0,
    "Credit card" => 1,
    "Pick up" => 2
    }


    def add_order_items_from_cart(current_order)
      current_order.order_items.each do |item|
        item.order_id = nil
        order_items << item
      end
    end
end
