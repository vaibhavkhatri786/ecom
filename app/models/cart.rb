class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
  belongs_to :address, optional: true

  def sub_total
    total = 0
    cart_items.each do |cart_item|
      total += cart_item.item_total
    end
    total
  end
end
