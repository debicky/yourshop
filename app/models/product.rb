class Product < ApplicationRecord
  has_many :order_items
  belongs_to :category
  has_one_attached :img
  before_destroy :ensure_noone_is_buying



  validates :title, :body, :img, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  private

  def ensure_noone_is_buying
    unless order_items.empty?
      errors.add(:base, "Cart contains this item")
      throw :abort
    end
  end

  extend FriendlyId
  friendly_id :title, use: :slugged
  
end
