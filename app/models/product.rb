class Product < ApplicationRecord
	has_many_attached :pictures, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :category

  validates :price, :description, :name, presence: true
end
