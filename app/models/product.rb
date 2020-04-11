class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :img

  validates :title, :body, :img, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :img, allow_blank: true, format: {
    with: %r{\.(jpeg|jpg|png)\z}i,
    message: 'must be a URL for JPEG, JPG or PNG image.'}
  
end
