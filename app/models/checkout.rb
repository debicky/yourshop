class Checkout < ApplicationRecord
  validates :first_name, :last_name, :address, :city, :country, :postal_code, :email, presence: true
  has_many :order_items, dependent: :destroy

  def add_order_items_from_cart(current_order)
    current_order.order_items.each do |item|
      item.order_id = nil
      order_items << item
    end
  end
end
