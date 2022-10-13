class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def item_total
    quantity*product.price
  end
end
